import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/home/main_food_page.dart';
import 'package:flutter_application_2/view/home/popular_food_details.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: PopularFoodDetails(),
    );
  }
}
