import 'package:flutter/material.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class SaveAsButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected; // ✅ Added selected parameter
  final VoidCallback onTap;

  const SaveAsButton({
    super.key,
    required this.icon,
    required this.label,
    required this.selected, // ✅ Accept selected
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: selected
              ? Colors.grey[700]
              : Colors.white, // ✅ Highlight selected button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
                color: selected
                    ? Colors.grey[700]!
                    : Colors.black54), // ✅ Match border with selected state
          ),
        ),
        onPressed: onTap,
        icon: Icon(icon,
            color:
                selected ? Colors.white : Colors.black), // ✅ Change icon color
        label: CustomText(
          text: label,
          size: 16,
          color: selected ? Colors.white : Colors.black, // ✅ Adjust text color
          fontFamily: FontType.sfPro,
        ),
      ),
    );
  }
}
