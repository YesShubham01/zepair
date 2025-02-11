import 'package:flutter/material.dart';

class CustomCardWidget extends StatefulWidget {
  final Widget child;

  const CustomCardWidget({super.key, required this.child});

  @override
  State<CustomCardWidget> createState() => _CustomCardWidgetState();
}

class _CustomCardWidgetState extends State<CustomCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: const Color.fromARGB(100, 241, 237, 237),
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        side: BorderSide(
          color: Colors.black26,
          width: 1,
        ),
      ),
      child: widget.child,
    );
  }
}
