import 'package:flutter/material.dart';
import 'package:flutter_find_house/pages/splash_page.dart';
import 'package:flutter_find_house/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage()
    );
  }
}
