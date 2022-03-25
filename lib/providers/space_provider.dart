import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/space.dart';

class SpaceProvider extends ChangeNotifier {
  getRecommendedSpaces() async {
    String url = 'http://bwa-cozy.herokuapp.com/recommended-spaces';
    var result = await http.get(Uri.parse(url));

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Space> spaces = data.map((e) => Space.fromJson(e)).toList();
      return spaces;
    } else {
      return <Space>[];
    }
  }
}
