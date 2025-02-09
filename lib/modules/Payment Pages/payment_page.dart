import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  void initState() {
    super.initState();
    payWithGooglePay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select UPI App")),
      body: const CircularProgressIndicator(),
    );
  }

  void payWithGooglePay() async {
    String upiUri = Uri(
      scheme: 'upi',
      host: 'pay',
      queryParameters: {
        'pa': 'pranjalbharat07@oksbi', // Replace with actual UPI ID
        'pn': 'Zepair',
        // 'mc': '1234', // Merchant code (optional)
        // 'tid': 'TXN123456789', // Transaction ID (optional)
        // 'tr': 'ORDER123', // Order ID (optional)
        'tn': 'Payment for order',
        'am': '1.00', // Amount
        'cu': 'INR', // Currency
        // 'url': 'https://merchant.com/payment-details' // Optional URL
      },
    ).toString();

    if (await canLaunchUrl(Uri.parse(upiUri))) {
      await launchUrl(Uri.parse(upiUri));
    } else {
      print("Could not launch Google Pay UPI");
    }
  }
}
