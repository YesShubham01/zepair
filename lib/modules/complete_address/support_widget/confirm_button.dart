import 'package:flutter/material.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class ConfirmButton extends StatelessWidget {
  late double h;
  late double w;
 ConfirmButton({super.key});
  

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.of(context).size;
    w = dimensions.width;
    h = dimensions.height;
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Padding(
        padding: EdgeInsets.only(left: 0.02*w,right: 0.04),
        child: ElevatedButton(
          
          style: ElevatedButton.styleFrom(
            
            backgroundColor: Color.fromARGB(255, 234, 190, 17),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            side: BorderSide(color: Colors.black)
          ),
          onPressed: () {},
          child: CustomText(text: "Confirm address",fontFamily: FontType.sfPro,size: 22,color: Colors.black,)
        ),
      ),
    );
  }
}
