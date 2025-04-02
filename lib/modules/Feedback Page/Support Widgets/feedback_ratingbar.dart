import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';

class FeedbackRatingBar extends StatefulWidget {
  final Function(double) onRatingChanged;

  const FeedbackRatingBar({super.key, required this.onRatingChanged});

  @override
  State<FeedbackRatingBar> createState() => _FeedbackRatingBarState();
}

class _FeedbackRatingBarState extends State<FeedbackRatingBar> {
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = 0; // Initial rating set to 0
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RatingBar.builder(
          initialRating: _rating,
          minRating: 1,
          allowHalfRating: true,
          unratedColor: const Color.fromARGB(99, 152, 150, 150),
          itemCount: 5,
          itemSize: h * 0.045,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
            widget.onRatingChanged(_rating); // Notify parent of rating change
          },
        ),
        const Gap(5),
        Text(
          _rating.toStringAsFixed(1), // Display rating with one decimal place
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
