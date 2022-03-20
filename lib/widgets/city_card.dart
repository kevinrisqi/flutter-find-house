import 'package:flutter/material.dart';
import 'package:flutter_find_house/themes.dart';

class CityCard extends StatelessWidget {
  const CityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 150,
      color: secondaryGreyColor,
      child: Column(
        children: [
          Image.asset(
            'assets/image_city1.png',
            width: 120,
            height: 102,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 11,
          ),
          Text(
            'Jakarta',
            style: blackTextStyle.copyWith(
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
