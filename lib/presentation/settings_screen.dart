import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whether_app/core/cubits/user_cubit/user_cubit.dart';
import 'package:whether_app/manager/text_manager.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> tempUnits = ["°C", "°F"];
  List<String> windSUnits = ["km/h", "ms", "mp/h", "kn"];
  String selectedTemp = "°C";
  String selectedWind = "km/h";
  bool fetchData = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            Location locationData =
                Location(latitude: 0, longitude: 0, timestamp: DateTime.now());
            if (state is HasData && fetchData) {
              selectedTemp = state.model.currentUnits?.temperature2M ?? "°C";
              selectedWind = state.model.currentUnits?.windSpeed10M ?? "km/h";
              locationData = Location(
                  latitude: state.model.latitude ?? 0,
                  longitude: state.model.longitude ?? 0,
                  timestamp: DateTime.now());
              fetchData = false;
            }

            return ListView(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:3.0.w),
                  child: Text(
                    "Settings:",
                    style: secondaryHeaderFontStyle,
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text(
                    "Temperature UNITS",
                    style: dropDownTitleFont,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  child: DropdownButton(
                    value: selectedTemp,
                    isExpanded: true,
                    icon: const Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      color: Colors.white54,
                    ),
                    underline: const SizedBox(),
                    style: dropDownTitleFont,
                    items: List.generate(
                      tempUnits.length,
                      (index) {
                        return DropdownMenuItem(
                            value: tempUnits[index],
                            child: Text(
                              tempUnits[index],
                              style: dropDownDataFont,
                            ));
                      },
                    ),
                    onChanged: (value) {

                      setState(() {
                        selectedTemp = value ?? tempUnits.first;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text(
                    "WindSpeed UNITS",
                    style: dropDownTitleFont,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  child: DropdownButton(
                    value: selectedWind,
                    isExpanded: true,
                    icon: const Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      color: Colors.white54,
                    ),
                    underline: const SizedBox(),
                    style: dropDownTitleFont,
                    items: List.generate(
                      windSUnits.length,
                      (index) {
                        return DropdownMenuItem(
                            value: windSUnits[index],
                            child: Text(
                              windSUnits[index],
                              style: dropDownDataFont,
                            ));
                      },
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedWind = value ?? windSUnits.first;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<UserCubit>(context).getWeatherData(
                            location: locationData,
                            tempUnits: selectedTemp,
                            windsUnits: selectedWind);
                        fetchData = true;
                      },
                      child: state is Loading ? Center(child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: const CircularProgressIndicator(),
                      )) : Text(
                        "Save",
                        style: dropDownDataFont,
                      )),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
