import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class PaymentResponseErrorPage extends StatefulWidget {
  final PaymentFailureResponse response;
  const PaymentResponseErrorPage({super.key, required this.response});

  @override
  State<PaymentResponseErrorPage> createState() =>
      _PaymentResponseErrorPageState();
}

class _PaymentResponseErrorPageState extends State<PaymentResponseErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: CustomText(text: widget.response.toString()),
      ),
    );
  }
}
