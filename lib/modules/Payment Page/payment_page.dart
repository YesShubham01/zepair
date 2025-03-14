import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:zepair/modules/Payment%20Page/Payment%20Response%20Pages/payment_response_success.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_button.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Payment Response Pages/payment_response_error.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _razorpay = Razorpay();
  String? _orderId;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    createOrder();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.primary,
        body: Center(
          child: _isLoading
              ? const CircularProgressIndicator()
              : CustomButton(text: "Pay Now", onPressed: _openPaymentSheet),
        ),
      ),
    );
  }

  Future<void> createOrder() async {
    setState(() => _isLoading = true);

    final url = Uri.parse(
        'https://us-central1-zepair-backend.cloudfunctions.net/createOrder');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "amount": 500, // Amount in paise (₹5)
          "currency": "INR",
          "receipt": "order_123",
          "partial_payment": false,
          "notes": {"customer": "Shubham Puhal", "service": "AC Repair"}
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          _orderId = jsonResponse['id'];
        });
      } else {
        print("Failed to create order: ${response.body}");
      }
    } catch (e) {
      print("Error while creating order: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _openPaymentSheet() {
    if (_orderId == null) {
      print("Order ID is null, cannot proceed.");
      return;
    }

    var options = {
      'key': 'rzp_test_RaavXK8adaE1X9',
      'amount': 500, // ₹5 in paise
      'currency': "INR",
      'name': 'Shubham Puhal',
      'order_id': _orderId,
      'description': 'AC Service',
      'timeout': 100,
      'prefill': {'contact': '9000090000', 'email': 'gaurav.kumar@example.com'}
    };

    try {
      _razorpay.open(options);
      print("Payment Sheet Launched");
    } catch (e) {
      print("Error launching Razorpay: $e");
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Successful: ${response.paymentId}");
    // Handle success (e.g., update order status in DB)
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => PaymentResponseSuccessPage(
              response: response,
            )));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment Failed: ${response.message}");
    // Show error message to user
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => PaymentResponseErrorPage(
              response: response,
            )));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("External Wallet Selected: ${response.walletName}");
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
