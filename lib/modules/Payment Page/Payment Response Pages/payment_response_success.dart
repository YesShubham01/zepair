import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:zepair/backend/appointment_service.dart';
import 'package:zepair/backend/authentication_backend.dart';
import 'package:zepair/backend/payment_backend.dart';
import 'package:zepair/models/appointment_model.dart';
import 'package:zepair/modules/Home%20Pages/home_screen.dart';
import 'dart:convert';

import 'package:zepair/utils/custom%20widgets/custom_text.dart';
import 'package:zepair/utils/custom%20widgets/custom_title.dart';

import '../../Home Pages/home_page.dart';

class PaymentResponseSuccessPage extends StatefulWidget {
  final String backendOrderId;
  final PaymentSuccessResponse response;
  final String amountInRupees;
  const PaymentResponseSuccessPage(
      {super.key,
      required this.response,
      required this.backendOrderId,
      required this.amountInRupees});

  @override
  State<PaymentResponseSuccessPage> createState() =>
      _PaymentResponseSuccessPageState();
}

class _PaymentResponseSuccessPageState
    extends State<PaymentResponseSuccessPage> {
  bool isVerified = false;
  bool isLoading = true;
  bool isError = false;

  late double h;
  late double w;

  @override
  void initState() {
    super.initState();
    _verifyPayment();
  }

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;

    return PopScope(
      canPop: false, // Prevents default back navigation
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (Route<dynamic> route) => false, // Removes all previous pages
          );
        }
      },
      child: Scaffold(
        backgroundColor: isLoading
            ? Colors.white // Show white while verifying
            : isVerified
                ? Colors.green.shade500 // ✅ Success
                : Colors.red, // ❌ Error

        body: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : isVerified
                  ? _getSuccessUI()
                  : const CustomText(
                      text:
                          "Payment Verification Failed! Please contact support.",
                      color: Colors.white,
                    ),
        ),
      ),
    );
  }

  Widget _getSuccessUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //sticker
        //! change sticker here later!
        Lottie.asset("assets/lotties/wink_animation.json",
            height: h * 0.4, repeat: true, fit: BoxFit.cover),
        //text
        CustomText(
          text: "₹ ${widget.amountInRupees}",
          size: 42,
        ),
        CustomTitle(text: "Payment Successful"),
      ],
    );
  }

  Future<void> _verifyPayment() async {
    bool result = await PaymentBackend.verifyPayment(
        widget.backendOrderId, widget.response);

    if (result) {
      _createAppointmentInFireStore();
    }

    setState(() {
      isVerified = result;
      isLoading = false;
    });
  }

  void _createAppointmentInFireStore() {
    Appointment appointment = Appointment(
      appointmentId:
          widget.backendOrderId, // Use backendOrderId as appointment ID
      uid: AuthenticationBackend.getUserUid(), // Replace with actual user ID
      title: "Service Appointment", // Replace with actual title
      amountPaid: 100, // Replace with actual amount
      description: "Service description", // Replace with actual description
      timestamp: Timestamp.now(),
      imagePath:
          "assets/images/Devices_Icons/custom_ac.png", // Replace with actual image path if needed
      status: "Payment Verified.",
      razorpayOrderId: widget.backendOrderId,
      razorpayPaymentId: widget.response.paymentId ?? "Payment Id is empty",
      razorpayPaymentSignature:
          widget.response.signature ?? "Payment Signature is empty",
    );

    AppointmentService.addAppointment(appointment);
  }
}
