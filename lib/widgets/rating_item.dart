import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;

  const RatingItem({required this.index, required this.rating, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icon_star.png',
      width: 20,
    );
  }
}
