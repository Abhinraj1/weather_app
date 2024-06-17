import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whether_app/core/cubits/location_permission_cubit/location_permission_cubit.dart';
import 'package:whether_app/core/cubits/search_cubit/search_cubit.dart';
import 'package:whether_app/core/cubits/user_cubit/user_cubit.dart';
import 'package:whether_app/presentation/home_screen.dart';
import 'package:whether_app/presentation/search_screen.dart';
import 'package:whether_app/presentation/splash_Screen.dart';

import 'core/cubits/connectivity_cubit/connectivity_cubit.dart';
import 'core/repository/main_repo.dart';
import 'manager/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => MainRepo(),
        ),
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider<LocationPermissionCubit>(
                create: (context) => LocationPermissionCubit()),
            BlocProvider<ConnectivityCubit>(
              create: (context) => ConnectivityCubit(),
            ),
            BlocProvider<SearchCubit>(
              create: (context) => SearchCubit(),
            ),
            BlocProvider<UserCubit>(
              create: (context) => UserCubit(repo: context.read<MainRepo>()),
            ),
          ],
          child: ResponsiveSizer(builder: (context, orientation, screenType) {
            return GetMaterialApp(
              title: 'Weather App',
              getPages: appRoutes(),
              initialRoute: "/",
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const SplashScreen(),
            );
          })),
    );
  }
}
