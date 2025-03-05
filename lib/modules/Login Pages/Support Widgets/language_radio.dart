import 'package:flutter/material.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class LanguageRadio extends StatelessWidget {
  final double w;
  final String label;
  final String startText;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageRadio({
    super.key,
    required this.w,
    required this.label,
    required this.startText,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(217, 217, 217, 0.75),
          borderRadius: BorderRadius.circular(w * 0.024),
        ),
        padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: w * 0.04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: w * 0.05,
                  height: w * 0.05,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? const Color.fromRGBO(231, 97, 0, 1)
                          : Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            width: w * 0.025,
                            height: w * 0.025,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(231, 97, 0, 1),
                            ),
                          ),
                        )
                      : null,
                ),
                SizedBox(width: w * 0.02),
                CustomText(
                  text: label,
                  size: 18,
                  weight: FontWeight.w400,
                ),
              ],
            ),
            CustomText(
              text: startText,
              size: 18,
              weight: FontWeight.w400,
              color: const Color.fromRGBO(112, 75, 48, 1),
            ),
          ],
        ),
      ),
    );
  }
}
