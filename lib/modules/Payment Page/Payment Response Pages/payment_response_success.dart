import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class PaymentResponseSuccessPage extends StatefulWidget {
  final PaymentSuccessResponse response;
  const PaymentResponseSuccessPage({super.key, required this.response});

  @override
  State<PaymentResponseSuccessPage> createState() =>
      _PaymentResponseSuccessPageState();
}

class _PaymentResponseSuccessPageState
    extends State<PaymentResponseSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: CustomText(text: widget.response.toString()),
      ),
    );
  }
}
