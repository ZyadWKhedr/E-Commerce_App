import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app_colors.dart';
import 'package:flutter_application_2/core/widgets/big_text.dart';
import 'package:flutter_application_2/core/widgets/small_text.dart';
import 'package:flutter_application_2/view/home/food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    log("Current height is " + MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 45,
                bottom: 15,
              ),
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Egypt",
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(text: "Alexandria"),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                          )
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.mainColor,
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
            FoodPageBody(),
          ],
        ),
      ),
    );
  }
}
