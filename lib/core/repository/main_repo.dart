import "dart:convert";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:geocoding/geocoding.dart";
import 'package:http/http.dart';
import "package:whether_app/core/models/weather_model.dart";

import "../cubits/user_cubit/user_cubit.dart";

class MainRepo{


  Future<WeatherModel?> getWhetherData({required Location location,String? tempUnits,String? windsUnits})async{

    final String baseUrl =
        "https://api.open-meteo.com/v1/forecast?latitude="
        "${location.latitude}&longitude=${location.longitude}"
        "&current=temperature_2m,rain,cloud_cover,"
        "snowfall,wind_speed_10m&hourly=temperature_2m,cloud_cover,"
        "rain&daily=temperature_2m_max,"
        "temperature_2m_min&${tempUnits}${windsUnits}forecast_days=16";


    try{
      final response = await get(Uri.parse(baseUrl));
      print("response =============${response.body}");
     final model = WeatherModel.fromJson(jsonDecode(response.body));
     return model;
    }catch(e){
      if (kDebugMode) {
        print("error calling getWhetherData =$e");
      }
    }
    return null;
  }
}