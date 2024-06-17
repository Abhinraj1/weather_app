import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whether_app/core/cubits/search_cubit/search_cubit.dart';
import 'package:whether_app/core/cubits/user_cubit/user_cubit.dart';
import 'package:whether_app/manager/text_manager.dart';

import '../widgets/search_widgets/search_bg_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SearchBgWidget(
      child: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: SearchBar(
                hintText: "Search",
                controller: textEditingController,
                textStyle: WidgetStatePropertyAll(thirdHeaderFontStyle),
                hintStyle: WidgetStatePropertyAll(thirdHeaderFontStyle),
                surfaceTintColor: const WidgetStatePropertyAll(Colors.white),
                backgroundColor:
                    WidgetStatePropertyAll(Colors.deepPurple.withOpacity(0.7)),
                trailing: [
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      textEditingController.clear();
                    },
                  ),
                ],
                onChanged: (value) {
                  if (value.trim().isNotEmpty && value.trim().length >= 4) {
                    BlocProvider.of<SearchCubit>(context)
                        .getLocationSuggestion(searchItem: value.trim());
                  }
                },
              ),
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                List<Location> locations = [];
                List<Placemark> placeMarks = [];
                if (state is SearchLoaded) {
                  locations = state.locations;
                  placeMarks = state.placeMarks;
                }
                if (state is SearchLoading) {
                  return Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: const CircularProgressIndicator(),
                  ));
                }
                return SizedBox(
                  height: 70.h,
                  child: ListView.builder(
                    itemCount: placeMarks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        dense: true,
                        onTap: () {
                          Get.back();

                          BlocProvider.of<UserCubit>(context).getWeatherData(
                              location: locations[index],
                              name: placeMarks[index].administrativeArea);
                        },
                        title: Text(
                          placeMarks[index].administrativeArea ?? "N/A",
                          style: secondaryHeaderFontStyle,
                        ),
                        trailing: Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                          size: 2.h,
                        ),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    ));
  }
}
