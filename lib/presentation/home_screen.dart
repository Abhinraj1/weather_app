import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:text_gradiate/text_gradiate.dart';
import 'package:whether_app/core/cubits/location_permission_cubit/location_permission_cubit.dart';
import 'package:whether_app/core/cubits/location_permission_cubit/location_permission_cubit.dart';
import 'package:whether_app/core/cubits/user_cubit/user_cubit.dart';
import 'package:whether_app/manager/image_manager.dart';
import 'package:whether_app/utils/weather_status.dart';
import 'package:whether_app/widgets/custom_widget/custom_snackBar.dart';
import 'package:whether_app/widgets/home_widgets/home_bg_widget.dart';

import '../core/models/weather_model.dart';
import '../manager/text_manager.dart';
import '../utils/time_and_date_formatter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  String locationName = "**Please Enable Location Permission";

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          BlocProvider.of<LocationPermissionCubit>(context).locationInit();
        },
        child: Padding(
          padding: EdgeInsets.only(bottom: 34.h),
          child: GlassContainer(
            width: 20.w,
            height: 5.h,
            color: Colors.deepPurple.withOpacity(0.2),
            borderColor: Colors.white54,
            borderRadius: BorderRadius.circular(30),
            blur: 8,
            child:
                BlocBuilder<LocationPermissionCubit, LocationPermissionState>(
              builder: (context, state) {
                if (state is LocationPermissionLoading) {
                  return const Center(
                      heightFactor: 0.1,
                      widthFactor: 0.1,
                      child: Icon(
                        Icons.refresh_outlined,
                        color: Colors.white54,
                      ));
                }
                return Center(
                    child: Text(
                  "Get Location",
                  style: dataFontStyle,
                ));
              },
            ),
          ),
        ),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          WeatherModel? weatherModel;
          String tUnits = "C";
          String wUnits = "km/h";
          String todayTemp = "0$tUnits";
          String cloudCover = "0%";
          String high = "0$tUnits";
          String lows = "0$tUnits";
          int hourlyDataLength = 0;
          int daysDataLength = 0;
          String bgImage = sunBg;
          String windSpeed = "0$wUnits";

          if (state is HasData) {
            if(state.name != null){
              locationName = state.name ?? "**Please Enable Location Permission";
            }else{
              locationName = "**Please Enable Location Permission";
            }
            weatherModel = state.model;
            tUnits = (weatherModel.currentUnits?.temperature2M).toString();
            wUnits = (weatherModel.currentUnits?.windSpeed10M).toString();
            todayTemp =
                (weatherModel.current?.temperature2M.toString() ?? "0") +
                    tUnits;
            cloudCover = weatherModel.current?.cloudCover.toString() ?? "0%";

            windSpeed =  (weatherModel.current?.windSpeed10M.toString() ?? "0") +
                wUnits;
            double actTemp = weatherModel.current?.temperature2M ?? 0;
            high = (actTemp + 5).floorToDouble().toString() + tUnits;
            lows = (actTemp - 5).ceilToDouble().toString() + tUnits;

            hourlyDataLength = weatherModel.hourly?.time?.length ?? 0;
            daysDataLength = weatherModel.daily?.time?.length ?? 0;

            bgImage = weatherStatus(
                rain: weatherModel.current?.rain ?? 0,
                cloud: weatherModel.current?.cloudCover ?? 0,
                forBg: true);
          }
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return HomeBgWidget(
            bgUrl: bgImage,
            child: Stack(
              children: [
                SizedBox(
                  width: 100.w,
                  height: 100.h,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      BlocBuilder<LocationPermissionCubit,
                          LocationPermissionState>(
                        builder: (context, lState) {
                          if (lState is LocationPermissionSuccess) {
                            locationName.contains("**Please Enable Location Permission") ?
                            locationName = lState.locationName : null;

                            return Center(
                              child: Text(
                                locationName,
                                style: secondaryHeaderFontStyle,
                              ),
                            );
                          } else {
                            return Center(
                                child: Text(
                              locationName,
                              style: thirdHeaderFontStyle,
                            ));
                          }
                        },
                      ),
                      TextGradiate(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: const [
                          Colors.white,
                          Colors.white,
                          Colors.black26
                        ],
                        text: Text(
                          todayTemp,
                          style: headerFontStyle,
                        ),
                      ),
                      Text(
                        "H:$high  L:$lows",
                        style: thirdHeaderFontStyle,
                      ),
                      Text(
                        "Cloud Cover: $cloudCover | Wind speed: $windSpeed",
                        style: thirdHeaderFontStyle,
                      ),

                      SizedBox(
                        height: 4.h,
                      ),
                      Image.asset(
                        house,
                        width: 80.w,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GlassContainer(
                    width: 100.w,
                    height: 35.h,
                    color: Colors.deepPurple.withOpacity(0.2),
                    borderColor: Colors.white54,
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.circular(65)),
                    blur: 8,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                onPressed: () {
                                  pageController.animateToPage(0,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                },
                                child: Text(
                                  "Hourly",
                                  style: buttonFontStyle,
                                )),
                            TextButton(
                                onPressed: () {
                                  pageController.animateToPage(1,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                },
                                child: Text("Days", style: buttonFontStyle)),
                          ],
                        ),
                        const Divider(
                          height: 1,
                          color: Colors.white60,
                        ),
                        SizedBox(
                          height: 26.7.h,
                          child: PageView(
                              controller: pageController,
                              allowImplicitScrolling: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                SizedBox(
                                  width: 100.w,
                                  height: 26.7.h,
                                  child: ListView.builder(
                                      itemCount: hourlyDataLength,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        String iconImage = sun;
                                        String temp = (weatherModel?.hourly
                                                    ?.temperature2M?[index]
                                                    .toString() ??
                                                "0") +
                                            tUnits;
                                        iconImage = weatherStatus(
                                            rain: weatherModel
                                                    ?.hourly?.rain?[index] ??
                                                0,
                                            cloud: weatherModel?.hourly
                                                    ?.cloudCover?[index] ??
                                                0);
                                        return Center(
                                          child: GlassContainer(
                                            width: 12.w,
                                            height: 18.h,
                                            shadowColor: Colors.black,
                                            margin: EdgeInsets.only(left: 2.w),
                                            elevation: 2,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.3),
                                                  blurRadius: 5,
                                                  spreadRadius: 2)
                                            ],
                                            color: Colors.deepPurple
                                                .withOpacity(0.5),
                                            borderColor:
                                                Colors.white54.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            blur: 8,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  formatTime(weatherModel
                                                          ?.hourly?.time?[index]
                                                          .toString() ??
                                                      "2024-06-16T00:00"),
                                                  style: dataFontStyle,
                                                ),
                                                Image.asset(
                                                  iconImage,
                                                  width: 6.w,
                                                ),
                                                Text(
                                                  temp,
                                                  style: dataFontStyle,
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                SizedBox(
                                  width: 100.w,
                                  height: 26.7.h,
                                  child: ListView.builder(
                                      itemCount: daysDataLength,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        String iconImage = sun;
                                        String temp = (weatherModel?.daily
                                                    ?.temperature2MMax?[index]
                                                    .toString() ??
                                                "0") +
                                            tUnits;
                                        iconImage = weatherStatus(
                                            rain: weatherModel
                                                    ?.hourly?.rain?[index] ??
                                                0,
                                            cloud: weatherModel?.hourly
                                                    ?.cloudCover?[index] ??
                                                0);
                                        return Center(
                                          child: GlassContainer(
                                            width: 12.w,
                                            height: 18.h,
                                            shadowColor: Colors.black,
                                            margin: EdgeInsets.only(left: 2.w),
                                            elevation: 2,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.3),
                                                  blurRadius: 5,
                                                  spreadRadius: 2)
                                            ],
                                            color: Colors.deepPurple
                                                .withOpacity(0.5),
                                            borderColor:
                                                Colors.white54.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            blur: 8,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  getDateNumberOrNow(
                                                      weatherModel?.daily
                                                              ?.time?[index]
                                                              .toString() ??
                                                          "2024-06-16"),
                                                  style: dataFontStyle,
                                                ),
                                                Image.asset(
                                                  iconImage,
                                                  width: 6.w,
                                                ),
                                                Text(
                                                  temp,
                                                  style: dataFontStyle,
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 3.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.toNamed("/search");
                            },
                            icon: const Icon(
                              CupertinoIcons.search_circle,
                              color: Colors.white60,
                            )),
                        SizedBox(
                          width: 70.w,
                        ),
                        IconButton(
                            onPressed: () {
                              Get.toNamed("/settings");
                            },
                            icon: const Icon(
                              CupertinoIcons.settings_solid,
                              color: Colors.white60,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
