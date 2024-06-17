import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:meta/meta.dart';
import 'package:whether_app/core/models/units_model.dart';
import 'package:whether_app/core/models/weather_model.dart';
import 'package:whether_app/core/repository/main_repo.dart';

import '../../../utils/units_filter.dart';
import '../../../widgets/custom_widget/custom_snackBar.dart';
import '../search_cubit/search_cubit.dart';

part 'user_state.dart';

//
// WindSpeedUnitsModel windUnits = WindSpeedUnitsModel(name: 'Kmph', value: "");
// TemperatureUnitsModel tempUnits = TemperatureUnitsModel(name: '°C', value: "");

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.repo}) : super(UserInitial());
  final MainRepo repo;

  String filteredWindUnits = "";
  String filteredTempUnits = "";
  getWeatherData(
      {required Location location,
      String? name,
      String? tempUnits,
      String? windsUnits}) async {

    if(tempUnits != null){
      filteredTempUnits = tempFilter(units: tempUnits);
    }
    if(windsUnits != null){
      filteredWindUnits = windFilter(units: windsUnits);
    }


    emit(Loading());
    final model = await repo.getWhetherData(location: location,
    windsUnits:filteredWindUnits,tempUnits: filteredTempUnits );
    if (model != null) {
      emit(HasData(model: model, name: name));
      Get.toNamed("/home");
    } else {
      customSnackBar(
          message: "Please try after sometime..", isErrorMessage: true);
    }
  }
}
