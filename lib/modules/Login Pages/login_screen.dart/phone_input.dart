import 'package:flutter/material.dart';

Widget buildPhoneInput() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(10),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Row(
      children: [
        // Flag Container
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade300, blurRadius: 4),
            ],
          ),
          child: Image.asset(
            "assets/images/Flag.png", // Add flag image in assets
            width: 30,
            height: 20,
          ),
        ),

        const SizedBox(width: 10), // Space between flag and input field

        // Phone Number Container
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Text(
                  "+91",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SF Pro"),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Phone Number",
                      hintStyle:
                          TextStyle(color: Colors.grey, fontFamily: "SF Pro"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
