import 'package:flutter/material.dart';

import '../../../utils/custom widgets/custom_outline_card_widget.dart';
import '../../../utils/custom widgets/custom_text.dart';


import 'package:flutter/material.dart';
import '../../../utils/custom widgets/custom_outline_card_widget.dart';
import '../../../utils/custom widgets/custom_text.dart';

class OtherServicesSection extends StatefulWidget {
 

  const OtherServicesSection({super.key});

  @override
  _OtherServicesSectionState createState() => _OtherServicesSectionState();
}

class _OtherServicesSectionState extends State<OtherServicesSection> {
  bool _isExpanded1 = false; // State for Installation/Uninstallation
  bool _isExpanded2 = false; // State for Any other service

  @override
  Widget build(BuildContext context) {
     double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: "Other Services",
          fontFamily: FontType.sfPro,
          size: 24,
          weight: FontWeight.bold,
        ),
         SizedBox(height: h*0.01),

        // Installation/Uninstallation Section
        CustomCardWidget(
          child: Column(
            children: [
              ListTile(
                title: const CustomText(
                  text: "Installation/Uninstallation",
                  fontFamily: FontType.sfPro,
                  size: 18,
                ),
                trailing: IconButton(
                  icon: Icon(_isExpanded1 ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                  onPressed: () {
                    setState(() {
                      _isExpanded1 = !_isExpanded1;
                    });
                  },
                ),
              ),
              if (_isExpanded1)
                Container(
                  height: 90, // Empty block size
                  color:Colors.grey, // Light background color
                ),
            ],
          ),
        ),
        SizedBox(height:h*0.01),

        // Any Other Service Section
        CustomCardWidget(
          child: Column(
            children: [
              ListTile(
                title: const CustomText(
                  text: "Any other service",
                  fontFamily: FontType.sfPro,
                  size: 18,
                ),
                trailing: IconButton(
                  icon: Icon(_isExpanded2 ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                  onPressed: () {
                    setState(() {
                      _isExpanded2 = !_isExpanded2;
                    });
                  },
                ),
              ),
              if (_isExpanded2)
                Container(
                  height: 90, // Empty block size
                  color: Colors.grey, // Light background color
                ),
            ],
          ),
        ),
      ],
    );
  }
}
