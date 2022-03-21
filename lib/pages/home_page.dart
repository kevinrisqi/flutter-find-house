import 'package:flutter/material.dart';
import 'package:flutter_find_house/models/city.dart';
import 'package:flutter_find_house/themes.dart';
import 'package:flutter_find_house/widgets/city_card.dart';
import 'package:flutter_find_house/widgets/space_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: defaultMargin,
            horizontal: defaultMargin,
          ),
          child: ListView(
            children: [
              // NOTE: Header
              Text(
                'Explore Now',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                'Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              // NOTE: Popular City
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CityCard(
                      city: City(
                        id: 1,
                        name: 'Jakarta',
                        imageUrl: 'assets/image_city1.png',
                        isPopular: false,
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    CityCard(
                      city: City(
                        id: 2,
                        name: 'Bandung',
                        imageUrl: 'assets/image_city2.png',
                        isPopular: true,
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    CityCard(
                      city: City(
                        id: 3,
                        name: 'Malang',
                        imageUrl: 'assets/image_city3.png',
                        isPopular: false,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Recommended Space',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  SpaceCard(),
                  SizedBox(
                    height: 30,
                  ),
                  SpaceCard(),
                  SizedBox(
                    height: 30,
                  ),
                  SpaceCard(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
