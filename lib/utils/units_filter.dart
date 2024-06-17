import 'package:flutter/material.dart';

List<String> windSUnits = ["km/h", "ms", "mp/h", "kn"];

String tempFilter({required String units}) {
  switch (units) {
    case "°C":
      {
        return "";
      }
    case "°F":
      {
        return "&temperature_unit=fahrenheit";
      }

    default:
      {
        return "";
      }
  }
}


String windFilter({required String units}) {
  switch (units) {
    case "km/h":
      {
        return "";
      }
    case "ms":
      {
        return "&wind_speed_unit=ms&";
      }
    case "mp/h":
      {
        return "&wind_speed_unit=mph&";
      }
    case "kn":
      {
        return "&wind_speed_unit=kn&";
      }

    default:
      {
        return "";
      }
  }
}