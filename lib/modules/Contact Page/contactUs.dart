import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/modules/Contact%20Page/Support%20Widgets/faq.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_button.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';
import 'package:zepair/utils/custom%20widgets/custom_title.dart';
import '../../utils/custom widgets/custom_appbar.dart';

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
      appBar: const CustomAppBar(title: "Help & Support"),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitle(
                text: "FAQ",
              ),
              Gap(h * 0.006),
              const FAQWidget(),
              Gap(h * 0.006),
              _buildDropMessageSection(),
              Gap(h * 0.006),
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
        CustomTitle(
          text: "Drop Message",
        ),
        Gap(h * 0.011),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.02),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Type your query here...",
                border: InputBorder.none,
              ),
              maxLines: 4,
            ),
          ),
        ),
        Gap(h * 0.005),
        Align(
          alignment: Alignment.centerRight,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.blue.shade500), // Border color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 1), // Reduce padding
              minimumSize: Size.zero, // Allows button to shrink to content size
            ),
            child: CustomText(
              text: "Send",
              size: 20,
              fontFamily: FontType.sfPro,
              color: Colors.blue.shade500,
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
        CustomTitle(text: "Request a call"),
        Gap(h * 0.011),
        CustomOutlineButton(buttonText: "Book Call", onPressed: () {}),
      ],
    );
  }
}
