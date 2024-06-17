import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:text_gradiate/text_gradiate.dart';

import '../../manager/image_manager.dart';
import '../../manager/text_manager.dart';


class HomeBgWidget extends StatelessWidget {
  final Widget child;
  final String bgUrl;
  const HomeBgWidget({super.key, required this.child, required this.bgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
          image: DecorationImage(
              image: AssetImage(bgUrl),
              fit: BoxFit.cover,
              colorFilter:
              const ColorFilter.mode(Colors.deepPurple, BlendMode.overlay)
          )),
      child: GlassContainer(
        color: Colors.black.withOpacity(0.2),
        borderColor: Colors.white,
        borderRadius: BorderRadius.circular(4),
        blur: 5,
        borderGradient:
        const LinearGradient(colors: [Colors.white, Colors.transparent]),
        child: child
      ),
    );
  }
}
