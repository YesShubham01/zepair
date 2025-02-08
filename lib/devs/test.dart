import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Gap(200),
            CustomText(text: "Hello"), // by default SF-PRO
            Gap(20),
            CustomText(text: "Hello", fontFamily: FontType.balooBhai2),
            Gap(20),
            CustomText(text: "Hello", fontFamily: FontType.balsamiqSans),
          ],
        ),
      ),
    );
  }
}
