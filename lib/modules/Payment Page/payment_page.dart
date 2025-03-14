import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:zepair/backend/payment_backend.dart';
import 'package:zepair/modules/Payment%20Page/Payment%20Response%20Pages/payment_response_success.dart';
import 'package:zepair/utils/custom%20widgets/custom_loading_screen.dart';

import 'Payment Response Pages/payment_response_error.dart';

class PaymentPage extends StatefulWidget {
  final String amountInRupees;
  const PaymentPage({super.key, required this.amountInRupees});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _razorpay = Razorpay();
  String? _orderId;
  bool _isLoading = true;

  late double h;
  late double w;

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    _setOrderId();
  }

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;
    return Scaffold(
      body: Center(
        child: _isLoading
            ? const CustomLoadingScreen()
            : Lottie.asset("assets/lotties/wink_animation.json",
                height: h * 0.4, repeat: true, fit: BoxFit.cover),
      ),
    );
  }

  void _setOrderId() async {
    String amountInPaise = getAmountInPaise();
    _orderId = await PaymentBackend.generateOrderId(
        amountInPaise); // pass amount in Rupee

    setState(() {
      _isLoading = false;
      _openPaymentSheet();
    });
  }

  void _openPaymentSheet() {
    if (_orderId == null) {
      print("Order ID is null, cannot proceed.");
      return;
    }

    var options = {
      'key': PaymentBackend.razorpayPublicKey,
      'amount': getAmountInPaise(),
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
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => PaymentResponseSuccessPage(
              amountInRupees: widget.amountInRupees,
              response: response,
              backendOrderId: _orderId!,
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

  String getAmountInPaise() {
    return (int.parse(widget.amountInRupees) * 100).toString();
  }
}
