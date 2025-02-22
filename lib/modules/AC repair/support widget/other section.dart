import 'package:flutter/material.dart';

import '../../../utils/custom widgets/custom_outline_card_widget.dart';
import '../../../utils/custom widgets/custom_text.dart';


class OtherServicesSection extends StatelessWidget {
  const OtherServicesSection({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: "Other Services",
          fontFamily: FontType.sfPro,
          size: 24,
          weight: FontWeight.bold,
        ),
        const SizedBox(height: 15),
        CustomCardWidget(
          child: ListTile(
            title: const CustomText(text: "Installation/Uninstallation", fontFamily: FontType.sfPro, size: 18),
            trailing: const Icon(Icons.arrow_drop_down),
          ),
        ),
        const SizedBox(height: 10),
        CustomCardWidget(
          child: ListTile(
            title: const CustomText(text: "Any other service", fontFamily: FontType.sfPro, size: 18),
            trailing: const Icon(Icons.arrow_drop_down),
          ),
        ),
      ],
    );
  }
}
