import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentBackend {
  static String razorpayPublicKey = "rzp_test_RaavXK8adaE1X9";

  static Future<String?> generateOrderId(String amountInPaise) async {
    String? orderId;
    final url = Uri.parse(
        'https://us-central1-zepair-backend.cloudfunctions.net/createOrder');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "amount": amountInPaise, // converted rupee to paise
          "currency": "INR",
          "notes": {"customer": "Customer Name", "service": "AC Repair"}
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        orderId = jsonResponse['id'];
      } else {
        print("Failed to create order: ${response.body}");
      }
    } catch (e) {
      print("Error while creating order: $e");
    }
    return orderId;
  }

  static Future<bool> verifyPayment(
      String backendOrderId, PaymentSuccessResponse successResponse) async {
    try {
      final url = Uri.parse(
          "https://us-central1-zepair-backend.cloudfunctions.net/verifyPaymentSignature"); // Replace with actual endpoint

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "order_id": backendOrderId, // send and verify via backend Generated
          "razorpay_payment_id": successResponse.paymentId,
          "razorpay_signature": successResponse.signature
        }),
      );

      final responseData = jsonDecode(response.body);
      print(response.body);
      if (response.statusCode == 200 && responseData["success"] == true) {
        return true;
      }
    } catch (e) {
      print("Error verifying payment: $e");
    }
    return false;
  }
}
