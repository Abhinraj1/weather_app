import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final TextStyle headerFontStyle = TextStyle(
  fontWeight: FontWeight.w900,
  color: Colors.white60,
  fontSize: 8.h,
  shadows: [Shadow(color: Colors.black)],
);


final TextStyle secondaryHeaderFontStyle = TextStyle(
  fontWeight: FontWeight.w900,
  color: Colors.white60,
  fontSize: 6.h,
  letterSpacing: 0.6.w
);

final TextStyle thirdHeaderFontStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: Colors.white60,
  fontSize: 2.3.h,
);

final TextStyle buttonFontStyle = TextStyle(
  fontWeight: FontWeight.w700,
  color: Colors.white.withOpacity(0.7),
  fontSize: 2.h,
);

final TextStyle dataFontStyle = TextStyle(
  fontWeight: FontWeight.w700,
  color: Colors.white.withOpacity(0.9),
  fontSize: 1.4.h,
);

final TextStyle snackBarFont = TextStyle(
  fontWeight: FontWeight.w700,
  color: Colors.black.withOpacity(0.7),
  fontSize:3.5.h,
);

final TextStyle snackBarErrorFont = TextStyle(
  fontWeight: FontWeight.w700,
  color: Colors.red.withOpacity(0.9),
  fontSize:3.5.h,
);

final TextStyle dropDownTitleFont = TextStyle(
  fontWeight: FontWeight.w700,
  color: Colors.white70,
  fontSize:3.5.h,
);

final TextStyle dropDownDataFont = TextStyle(
  fontWeight: FontWeight.w500,
  color: Colors.grey,
  fontSize:3.2.h,
);