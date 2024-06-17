import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:text_gradiate/text_gradiate.dart';

import '../../manager/image_manager.dart';
import '../../manager/text_manager.dart';

class SearchBgWidget extends StatelessWidget {
  final Widget child;
  const SearchBgWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Stack(
        children: [
          Lottie.asset(searchBg, fit: BoxFit.cover,  height: 100.h,
            width: 100.w,),
          GlassContainer(
            height: 100.h,
              width: 100.w,
              color: Colors.black.withOpacity(0.2),
              borderColor: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4),
              blur: 5,
              ),
          child
        ],
      ),
    );
  }
}
