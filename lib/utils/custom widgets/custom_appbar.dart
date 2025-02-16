import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title; // Accepts title dynamically
  final bool applyBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.applyBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          applyBackButton ? _buildBackButton(context) : const Gap(5),
          CustomText(
            text: title,
            size: 24,
            fontFamily: FontType.sfPro,
            color: Colors.black,
            weight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  _buildBackButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Row(
        children: [
          Icon(
            Icons.arrow_back,
          ),
          Gap(10),
        ],
      ),
    );
  }
}
