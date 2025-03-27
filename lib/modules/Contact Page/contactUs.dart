import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/modules/Contact%20Page/Support%20Widgets/custom_popUp.dart';
import 'package:zepair/modules/Contact%20Page/Support%20Widgets/faq.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_button.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';
import 'package:zepair/utils/custom%20widgets/custom_title.dart';
import '../../backend/bookCall_backend.dart';
import '../../backend/message_service.dart';
import '../../utils/custom widgets/custom_appbar.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _HelpSupportPageState();
}

class _HelpSupportPageState extends State<ContactUsPage> {
  bool _isCallBooked = false;
  late double w;
  late double h;
  final TextEditingController _messageController = TextEditingController();
  String messageType = "User"; // Default to "User"

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
              CustomTitle(text: "FAQ"),
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
        CustomTitle(text: "Drop Message"),
        Gap(h * 0.011),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.02),
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: "Type your query here...",
                border: InputBorder.none,
              ),
              maxLines: 4,
            ),
          ),
        ),
        Gap(h * 0.011),

        // Dropdown for selecting message type
        /* DropdownButton<String>(
          value: messageType,
          items: ["User", "Technician"]
              .map((type) => DropdownMenuItem(value: type, child: Text(type)))
              .toList(),
          onChanged: (value) {
            setState(() {
              messageType = value!;
            });
          },
        ),*/
        Gap(h * 0.005),

        Align(
          alignment: Alignment.centerRight,
          child: OutlinedButton(
            onPressed: _sendMessage,
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.blue.shade500),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
              minimumSize: Size.zero,
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

  void _sendMessage() async {
    if (_messageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a message")),
      );
      return;
    }

    Timestamp timestamp = Timestamp.now(); // ✅ Capture system time

    await MessageService().sendMessage(
      message: _messageController.text,
      messageType: "USER",
      userId: "USER_123",
      phone: "+91XXXXXXXXXX",
    );

    showCustomPopup(context, "Message sent successfully!");

    _messageController.clear();
  }

  Widget _buildRequestCallSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(text: "Request a call"),
        Gap(h * 0.011),
        CustomOutlineButton(
          buttonText: _isCallBooked ? "Call Booked" : "Book Call",
          onPressed:
              _isCallBooked ? () {} : _getBookCallCallback(), // ✅ Never null
        ),
      ],
    );
  }

  // ✅ Returns VoidCallback
  VoidCallback _getBookCallCallback() {
    return () async {
      await CallService().bookCall(
        userId: "USER_123",
        phone: "+91XXXXXXXXXX",
      );

      setState(() {
        _isCallBooked = true; // Disable button after booking
      });

      showCustomPopup(
        context,
        "Call booked successfully! Our team will reach out to you shortly.",
      );
    };
  }
}
