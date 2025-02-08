import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/devs/Support%20Widgets/zepair_logo.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';
import 'package:lottie/lottie.dart';

class NotesForDevs extends StatefulWidget {
  const NotesForDevs({super.key});

  @override
  State<NotesForDevs> createState() => _NotesForDevsState();
}

class _NotesForDevsState extends State<NotesForDevs> {
  late double w; // width
  late double h; // height

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;

    return Scaffold(
      backgroundColor: CustomColors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(h * 0.1),
            ZepairLogo(
              h: h * 0.2,
              w: h * 0.2,
            ),
            Gap(h * 0.05),
            const CustomText(
              text: "Welcome Devs!",
              size: 32,
              weight: FontWeight.w100,
              color: Colors.white, 
            ),
            Lottie.asset("assets/lotties/wink_animation.json",
                height: h * 0.4, repeat: true, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}
