import 'package:flutter/material.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class SaveAsButton extends StatelessWidget {
  final IconData icon;
  final String label;
  late double h;
  late double w;

   SaveAsButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
     var dimensions = MediaQuery.of(context).size;
    w = dimensions.width;
    h = dimensions.height;
    
    return Padding(
      padding:  EdgeInsets.only(left: 0.01*w),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: const BorderSide(color: Colors.black54)),
        ),
        onPressed: () {},
        icon: Icon(icon, color: Colors.black),
        label:CustomText(text:label, size:18,color:Colors.black ,fontFamily: FontType.sfPro,)),
    );
    
  }
}
