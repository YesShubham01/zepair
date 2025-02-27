import 'package:flutter/material.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  late double w;
  late double h;

  ProfileMenuItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.005),
      child: CustomCardWidget(
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding:
                EdgeInsets.fromLTRB(w * 0.03, h * 0.016, w * 0.03, h * 0.016),
            child: Row(
              children: [
                Icon(icon, size: 24, color: Colors.black),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomText(
                  text: text,
                  size: 18,
                  fontFamily: FontType.sfPro,
                )),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
