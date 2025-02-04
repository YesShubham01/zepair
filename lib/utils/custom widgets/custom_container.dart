import 'package:flutter/material.dart';
/*
~How to use this Widget:
  this is a container with following parameters:-
    -child
    -padding : accept in format > EdgeInsets.symmetric(horizontal: w * 0.06, vertical: h * 0.03),
    -radius : accept in format >   BorderRadius.all(Radius.circular(5))
    -color
    
*/

class CustomContainer extends StatefulWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  const CustomContainer(
      {super.key, this.child, this.padding, this.color, this.borderRadius});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  late double w; // width
  late double h; // height
  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;
    return Container(
      padding: widget.padding ??
          EdgeInsets.symmetric(horizontal: w * 0.06, vertical: h * 0.03),
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius ??
            const BorderRadius.all(
              Radius.circular(5),
            ),
        color: widget.color ?? Colors.white,
      ),
      child: widget.child,
    );
  }
}
