import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/utils/custom%20widgets/custom_button.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

import '../../utils/custom widgets/custom_appbar.dart';
import 'support_widget/custom_save_button.dart';
import 'support_widget/custom_text_field.dart';

class AddNewAddressPage extends StatelessWidget {
  final String userName;
  final String userPhone;

  const AddNewAddressPage(
      {super.key, this.userName = "Oggy", this.userPhone = "+91 9876543210"});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double w = size.width;
    double h = size.height;

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Enter complete address",
        applyBackButton: true,
      ),
      body: SingleChildScrollView(
        // ✅ Prevents overflow when keyboard appears
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.005),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Info Container
              CustomCardWidget(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.04, vertical: h * 0.015),
                  child: Row(
                    children: [
                      const Icon(Icons.phone, color: Colors.black),
                      SizedBox(width: w * 0.02),
                      CustomText(
                          text: "$userName, ",
                          fontFamily: FontType.balooBhai2,
                          color: Colors.black),
                      CustomText(
                          text: userPhone,
                          fontFamily: FontType.balooBhai2,
                          size: 18,
                          color: Colors.black),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          // Handle edit action here (e.g., open a dialog)
                          print("Edit icon clicked!");
                        },
                        child: const Icon(Icons.edit, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: h * 0.03),

              // Address Input Fields
              CustomTextField(hintText: "Street Address *"),
              CustomTextField(hintText: "Apartment / floor (optional)"),
              CustomTextField(hintText: "City, State"),
              CustomTextField(hintText: "Zip Code"),
              CustomTextField(hintText: "Nearby landmark (optional)"),

              SizedBox(height: h * 0.03),

              // Save As Section
              Padding(
                padding: EdgeInsets.only(left: 0.02 * w),
                child: const CustomText(
                    text: "Save as",
                    fontFamily: FontType.sfPro,
                    color: Color.fromARGB(255, 0, 0, 0),
                    size: 18),
              ),
              SizedBox(height: h * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SaveAsButton(icon: Icons.home, label: "Home"),
                  Gap(w * 0.001),
                  SaveAsButton(icon: Icons.work, label: "Work"),
                  Gap(w * 0.001),
                  SaveAsButton(icon: Icons.location_on, label: "Other"),
                ],
              ),

              Gap(h * 0.15),

              // Confirm Button
              CustomButton(
                text: "Add Address",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
