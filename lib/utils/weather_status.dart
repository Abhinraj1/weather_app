

import 'package:flutter/material.dart';

import '../manager/image_manager.dart';

String weatherStatus({required double rain, required int cloud,bool? forBg}){

 if(rain >= 0.4){
   return forBg ?? false ? rainBg : rainIcon;
 }else if(cloud >= 45){
   return forBg ?? false ? cloudyBg : cloudIcon;
 }else{
   return forBg ?? false ? sunBg : sun;
 }

}