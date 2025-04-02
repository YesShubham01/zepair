import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:zepair/backend/feedback_backend.dart';
import 'package:zepair/modules/Contact%20Page/Support%20Widgets/custom_popUp.dart';
import 'package:zepair/modules/Feedback%20Page/Support%20Widgets/feedback_ratingbar.dart';
import 'package:zepair/modules/Home%20Pages/home_page.dart';
import 'package:zepair/modules/Home%20Pages/home_screen.dart';
import 'package:zepair/utils/constants/image_paths.dart';
import 'package:zepair/utils/custom%20widgets/custom_appbar.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_button.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';
import 'package:zepair/utils/custom%20widgets/custom_title.dart';

class FeedbackPage extends StatefulWidget {
  final String appointmentId;
  const FeedbackPage({super.key, required this.appointmentId});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  static const IconData beenhereSharp =
      IconData(0xe7da, fontFamily: 'MaterialIcons');
  late double w;
  late double h;
  double _rating = 0;
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: "Feedback",
        applyBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSuccessMessage(),
              Gap(h * 0.006),
              _buildWarrantyCard(),
              Gap(h * 0.006),
              _buildTechnicianRating(),
              Gap(h * 0.006),
              _buildFeedbackSection(),
              Gap(h * 0.01),
              CustomOutlineButton(buttonText: "Done", onPressed: _sendRating),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessMessage() {
    return Column(
      children: [
        SizedBox(
          width: w * 0.6,
          child: Lottie.asset(
            ImagePaths.feedbackLottieAnimation,
          ),
        ),
        Gap(h * 0.006),
        const Divider(
          color: Color.fromARGB(100, 195, 195, 195),
          thickness: 3,
        ),
        Gap(h * 0.011),
        const CustomText(
          text: 'Your Device has been repaired successfully.',
          size: 20,
          fontFamily: FontType.balsamiqSans,
          weight: FontWeight.w400,
          alignment: TextAlign.center,
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
            const Expanded(
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
        Gap(h * 0.011),
        FeedbackRatingBar(
          onRatingChanged: (rating) {
            setState(() {
              _rating = rating;
            });
          },
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
            child: TextField(
              controller: _feedbackController,
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
            onPressed: _sendFeedbackText,
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

  // sends only the feedback Text
  void _sendFeedbackText() {
    if (_feedbackController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a message")),
      );
      return;
    }
    if (_feedbackController.text.isNotEmpty) {
      FeedbackBackend.submitFeedbackText(
        appointmentId: widget.appointmentId,
        feedbackText: _feedbackController.text,
      );

      showCustomPopup(context, "Message sent successfully!");
      _feedbackController.clear();
    }
  }

  /// Sends only the rating when "Done" is clicked
  void _sendRating() {
    if (_rating > 0) {
      FeedbackBackend.submitRating(
        appointmentId: widget.appointmentId,
        rating: _rating,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }
}
