import 'package:flutter/material.dart';
import 'package:flutter_find_house/models/city.dart';
import 'package:flutter_find_house/models/space.dart';
import 'package:flutter_find_house/models/tips.dart';
import 'package:flutter_find_house/themes.dart';
import 'package:flutter_find_house/widgets/bottom_navbar.dart';
import 'package:flutter_find_house/widgets/city_card.dart';
import 'package:flutter_find_house/widgets/space_card.dart';
import 'package:flutter_find_house/widgets/tips_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: ListView(
            children: [
              // NOTE: Header
              SizedBox(height: defaultMargin,),
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
                  SpaceCard(
                    space: Space(
                      id: 1,
                      name: 'Kuretakaso Hott',
                      price: 52,
                      rating: 4,
                      city: 'Bandung',
                      country: 'Indonesia',
                      imageUrl: 'assets/image_space1.png',
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SpaceCard(
                    space: Space(
                      id: 2,
                      name: 'Roemah Nenek',
                      price: 11,
                      rating: 5,
                      city: 'Bogor',
                      country: 'Indonesia',
                      imageUrl: 'assets/image_space2.png',
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SpaceCard(
                    space: Space(
                      id: 3,
                      name: 'Darling How',
                      price: 20,
                      rating: 5,
                      city: 'Jakart',
                      country: 'Indonesia',
                      imageUrl: 'assets/image_space3.png',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              // NOTE: Tips & Guidance
              Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  TipsCard(
                    tips: Tips(
                        id: 1,
                        name: 'City Guidelines',
                        updateAt: '20 Apr',
                        imageUrl: 'assets/image_tips1.png'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    tips: Tips(
                        id: 2,
                        name: 'Jakarta Fairship',
                        updateAt: '11 Dec',
                        imageUrl: 'assets/image_tips2.png'),
                  )
                ],
              ),
              SizedBox(
                height: 65 + defaultMargin,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width - (defaultMargin * 2),
        height: 65,
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbar(
              imageUrl: 'assets/icon_home_active.png',
              isActive: true,
            ),
            BottomNavbar(
              imageUrl: 'assets/icon_mail_inactive.png',
              isActive: false,
            ),
            BottomNavbar(
              imageUrl: 'assets/icon_card_inactive.png',
              isActive: false,
            ),
            BottomNavbar(
              imageUrl: 'assets/icon_favorite_inactive.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
