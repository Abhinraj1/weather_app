import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whether_app/manager/text_manager.dart';

import '../core/cubits/location_permission_cubit/location_permission_cubit.dart';
import '../core/cubits/user_cubit/user_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<LocationPermissionCubit>(context).locationInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: BlocConsumer<LocationPermissionCubit, LocationPermissionState>(
        listener: (context, state) {
          if (state is LocationPermissionSuccess) {
            BlocProvider.of<UserCubit>(context).getWeatherData(
                location: Location(
                    latitude: state.position.latitude,
                    longitude: state.position.longitude,
                    timestamp: DateTime.now()));
          }
        },
        builder: (context, state) {
          return SizedBox(
            width: 100.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.cloud,
                  size: 35.w,
                  color: Colors.white.withOpacity(0.6),
                ),
                Text(
                  "Weather App",
                  style: headerFontStyle,
                ),
                const CircularProgressIndicator(color: Colors.white54,)
              ],
            ),
          );
        },
      ),
    );
  }
}
