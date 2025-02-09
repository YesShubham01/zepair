import 'package:flutter/material.dart';
import 'package:disclosure/disclosure.dart';
import 'package:gap/gap.dart';
import 'package:zepair/modules/Contact%20Page/Support%20Widgets/custom_button.dart';
import 'package:zepair/modules/Contact%20Page/Support%20Widgets/faq.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _HelpSupportPageState();
}

class _HelpSupportPageState extends State<ContactUsPage> {
  late double w;
  late double h;

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: header(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: w * 0.05, top: h * 0.005),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "FAQ",
                fontFamily: FontType.sfPro,
                size: 24,
                weight: FontWeight.bold,
              ),
              Gap(h * 0.011),
              FAQWidget(screenWidth: w),
              Gap(h * 0.02),
              _buildDropMessageSection(),
              Gap(h * 0.011),
              _buildRequestCallSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropMessageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
            text: "Drop Message",
            size: 24,
            fontFamily: FontType.sfPro,
            weight: FontWeight.bold),
        Gap(h * 0.011),
        Padding(
          padding: EdgeInsets.only(right: w * 0.05),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: w * 0.02),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Type your query here...",
                  border: InputBorder.none,
                ),
                maxLines: 6,
              ),
            ),
          ),
        ),
        Gap(h * 0.011),
        Padding(
          padding: EdgeInsets.only(right: w * 0.05),
          child: Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: w * 0.25, // Set the desired width
              height: h * 0.04, // Set the desired height
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.blue.shade500), // Border color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
                child: CustomText(
                  text: "Send",
                  size: 22,
                  fontFamily: FontType.sfPro,
                  color: Colors.blue.shade500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRequestCallSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Request a call",
          size: 24,
          fontFamily: FontType.sfPro,
          color: Colors.black,
          weight: FontWeight.bold,
        ),
        Gap(h * 0.011),
        BookCallButton(
          onPressed: () {},
          width: w * 0.89,
          height: h * 0.059,
        ),
        Gap(h * 0.03),
      ],
    );
  }

  Widget header() {
    return Row(
      children: [
        InkWell(
            onTap: () {},
            child: const Icon(Icons.arrow_back, color: Colors.black)),
        Gap(5), // 5 pixels spacing between the icon and text
        CustomText(
          text: "Help & Support",
          size: 24,
          fontFamily: FontType.sfPro,
          color: Colors.black,
          weight: FontWeight.bold,
        ),
      ],
    );
  }
}
