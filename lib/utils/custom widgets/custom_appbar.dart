import 'package:flutter/material.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title; // Accepts title dynamically

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context); // Moves back to the previous page
        },
      ),
      title: CustomText(text: title,fontFamily: FontType.sfPro,color: Colors.black), // Uses your custom text widget
     
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
