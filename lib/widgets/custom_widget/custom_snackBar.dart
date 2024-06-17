import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:whether_app/manager/text_manager.dart';

customSnackBar(
    {required String message, bool? isErrorMessage, bool? showOnTop}) {
  Get.snackbar(
    "",
    "",
    messageText: Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: isErrorMessage ?? false
              ? Icon(Icons.error_outline, color: Colors.red, size: 35)
              : Icon(Icons.check_circle_outline,
                  color: Colors.deepPurple, size: 35),
        ),
        SizedBox(
          width: 260,
          child: Text(message,
              style: isErrorMessage ?? false ? snackBarErrorFont : snackBarFont,
              textAlign: TextAlign.center,
              maxLines: 3),
        ),
      ],
    )),
    // snackPosition:
    //     showOnTop ?? false ? SnackPosition.TOP : SnackPosition.BOTTOM,
    backgroundColor: Colors.white,
    borderRadius: 20,
    padding: EdgeInsets.only(bottom: 25, left: 10, right: 10),

    margin: EdgeInsets.all(15),
    colorText: Colors.white,
    duration: Duration(seconds: 4),
    isDismissible: true,
    // dismissDirection: SnackDismissDirection.HORIZONTAL,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
