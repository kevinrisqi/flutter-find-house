import 'package:flutter/material.dart';
import 'package:flutter_find_house/pages/error_page.dart';
import 'package:flutter_find_house/themes.dart';
import 'package:flutter_find_house/widgets/facility_item.dart';
import 'package:flutter_find_house/widgets/rating_item.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/space.dart';

class DetailPage extends StatefulWidget {
  final Space space;

  // ignore: prefer_const_constructors_in_immutables
  DetailPage(this.space, {Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    int index = 0;

    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    Future<void> showConfirmation() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Konfirmasi'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Apakah kamu ingin menghubungi pemilik kos?'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Batal'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Hubungi'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    launchUrl('tel:${widget.space.phone}');
                  },
                ),
              ],
            );
          });
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              widget.space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.space.name,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${widget.space.price}',
                                    style: purpleTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5].map((index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    left: 2,
                                  ),
                                  child: RatingItem(
                                    index: index,
                                    rating: widget.space.rating,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Main Facilites',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              imageUrl: 'assets/icon_kitchen.png',
                              name: 'Kitchen',
                              total: widget.space.numberOfKitchens,
                            ),
                            FacilityItem(
                              imageUrl: 'assets/icon_bedroom.png',
                              name: 'Bedroom',
                              total: widget.space.numberOfBedrooms,
                            ),
                            FacilityItem(
                              imageUrl: 'assets/icon_cupboard.png',
                              name: 'Big Almari',
                              total: widget.space.numberOfCupboards,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Photos',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 88,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: widget.space.photos.map((item) {
                                index++;
                                return Container(
                                  margin: EdgeInsets.only(
                                      left: index == 1 ? 0 : 24),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      item,
                                      width: 110,
                                      height: 88,
                                    ),
                                  ),
                                );
                              }).toList()),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Location',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.space.address,
                                  style: regularTextStyle.copyWith(
                                    fontSize: 14,
                                    color: greyColor,
                                  ),
                                ),
                                Text(
                                  widget.space.city,
                                  style: regularTextStyle.copyWith(
                                    fontSize: 14,
                                    color: greyColor,
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                // launchUrl('https://bit.ly/3Jz2vnt');
                                launchUrl(widget.space.mapUrl);
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/button_navigation.png',
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                              primary: purpleColor,
                            ),
                            onPressed: () {
                              showConfirmation();
                            },
                            child: Center(
                              child: Text(
                                'Book Now',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/button_back.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Image.asset(
                      isFavorite
                          ? 'assets/button_wishlist_filled.png'
                          : 'assets/button_wishlist.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
