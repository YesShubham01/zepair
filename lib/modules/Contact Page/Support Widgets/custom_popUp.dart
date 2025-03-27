import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

void showCustomPopup(BuildContext context, String message) {
  AnimationController? animationController;

  showDialog(
    context: context,
    barrierDismissible: false, // Prevents dialog from closing on tap outside
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Lottie Animation
                Lottie.asset(
                  'assets/lotties/star_loading_animation.json',
                  width: 150,
                  height: 150,
                  repeat: false, // Play once
                  controller: animationController,
                  onLoaded: (composition) {
                    animationController = AnimationController(
                      vsync: Navigator.of(context),
                      duration: composition.duration,
                    )..forward().whenComplete(() {
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context)
                              .pop(); // Auto close when animation finishes
                        }
                      });
                  },
                ),
                const SizedBox(height: 10),
                CustomText(
                  text: message,
                  fontFamily: FontType.balsamiqSans,
                  size: 18,
                  weight: FontWeight.w400,
                ),
                const SizedBox(height: 15),
                // OK Button
                TextButton(
                  onPressed: () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop(); // Close the dialog manually
                    }
                  },
                  child: CustomText(
                    text: 'OK',
                    fontFamily: FontType.sfPro,
                    size: 18,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          );
        },
      );
    },
  );
}
