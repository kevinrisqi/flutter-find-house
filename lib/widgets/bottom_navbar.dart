import 'package:flutter/material.dart';
import 'package:flutter_find_house/themes.dart';

class BottomNavbar extends StatelessWidget {
  String imageUrl;
  bool isActive;

  BottomNavbar({required this.imageUrl, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imageUrl,
          width: 26,
          height: 26,
        ),
        Spacer(),
        isActive ? Container(
          width: 30,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
            color: purpleColor,
          ),
        ) : Container()
      ],
    );
  }
}
