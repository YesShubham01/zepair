import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_button.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';
import 'package:zepair/utils/custom%20widgets/custom_title.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  static const IconData beenhereSharp =
      IconData(0xe7da, fontFamily: 'MaterialIcons');
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
        title: Row(
          children: [
            Gap(w * 0.0001), // Adjust the width for custom spacing
            CustomText(
              text: "Feedback",
              size: 24,
              fontFamily: FontType.sfPro,
              color: Colors.black,
              weight: FontWeight.bold,
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.005),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSuccessMessage(),
              Gap(h * 0.015),
              _buildWarrantyCard(),
              Gap(h * 0.015),
              _buildTechnicianRating(),
              Gap(h * 0.015),
              _buildFeedbackSection(),
              Gap(h * 0.015),
              CustomOutlineButton(buttonText: "Done", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessMessage() {
    return Column(
      children: [
        Image.asset(
          'assets/images/celebration.png', // Replace with your actual image path
          width: 100, // Adjust size as needed
          height: 100,
        ),
        Gap(h * 0.015),
        const CustomText(
          text: 'Your Device has been repaired successfully.',
          size: 24,
          fontFamily: FontType.balooBhai2,
          weight: FontWeight.normal,
          alignment: TextAlign.left,
        ),
      ],
    );
  }

  Widget _buildWarrantyCard() {
    return CustomCardWidget(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const Icon(
              beenhereSharp,
              color: Colors.black,
              size: 42,
            ),
            Gap(w * 0.02),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'You have unlocked Warranty for this service.',
                      fontFamily: FontType.sfPro,
                      weight: FontWeight.bold,
                      size: 16,
                    ),
                    CustomText(
                      text: 'View full details on warranty sections.',
                      fontFamily: FontType.sfPro,
                      weight: FontWeight.normal,
                      size: 14,
                      alignment: TextAlign.start,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTechnicianRating() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(
          text: "Rate Our Technician",
        ),
        Gap(h * 0.006),
        const CustomText(
          text:
              'A HVAC technician is a skilled professional who installs, repairs to ensure optimal performance and energy efficiency.',
          size: 18,
          fontFamily: FontType.balooBhai2,
        ),
        Gap(h * 0.011),
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              5,
              (index) => const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 4.0), // Adjust gap here
                child: Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeedbackSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(
          text: "Feedback",
        ),
        Gap(h * 0.006),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.02),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Please give any feedback...",
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
}
