import 'package:flutter/material.dart';

class RatingAndReviewSection extends StatelessWidget {
  final double rating;
  final int reviewCount;
  final Function onTapReviews;

  const RatingAndReviewSection({
    required this.rating,
    required this.reviewCount,
    required this.onTapReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.yellow),
        Text('$rating'),
        TextButton(
          onPressed: () => onTapReviews(),
          child: Text(' (($reviewCount)개의 후기)'),
        ),
      ],
    );
  }
}
