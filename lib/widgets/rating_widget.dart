import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.onTap, required this.rating});
  final void Function() onTap;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: onTap,
          child: Icon(
            index < rating ? Icons.star_outline : Icons.star_border,
            size: 10,
            color: Colors.black,
          ),
        );
      }),
    );
  }
}
