import 'package:flutter/material.dart';
import 'package:zepair/modules/Add%20New%20Address%20Page/add_new_address.dart';
import 'package:zepair/utils/custom%20widgets/custom_button.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class LocationPermissionBottomSheet extends StatelessWidget {
  const LocationPermissionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.location_pin,
              size: 50,
            ),
          ),
          const SizedBox(height: 8),
          const CustomText(
            text: "Device location not enabled",
            size: 20,
            weight: FontWeight.w500,
            fontFamily: FontType.balooBhai2,
            alignment: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const CustomText(
            text: "Enable your device location for better experience",
            size: 16,
            weight: FontWeight.w400,
            fontFamily: FontType.balooBhai2,
            alignment: TextAlign.center,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: "Enable location permission",
              onPressed: () {
                Navigator.pop(context);
                navigateToAddAddressPage(context);
              },
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                navigateToAddAddressPage(context);
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const CustomText(
                text: "Search location manually",
                size: 22,
                weight: FontWeight.w400,
                fontFamily: FontType.sfPro,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  navigateToAddAddressPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const AddNewAddressPage(addBackButton: false),
    ));
  }
}
