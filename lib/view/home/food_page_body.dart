import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app_colors.dart';
import 'package:flutter_application_2/core/widgets/big_text.dart';
import 'package:flutter_application_2/core/widgets/icon_and_text_widget.dart';
import 'package:flutter_application_2/core/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  List<String> imageList = [
    'assets/images/wallpaperflare.com_wallpaper.jpg',
    'assets/images/bojack.jpg',
    'assets/images/wallpaperflare.com_wallpaper (18).jpg',
    'assets/images/wallpaperflare.com_wallpaper (20).jpg',
    'assets/images/wallpaperflare.com_wallpaper (29).jpg',
  ];
  List<String> titlesList = [
    'Ichigo',
    'Bojack Horseman',
    'Gojo Satoru',
    'Ben 10',
    'Saitama',
  ];

  PageController pageController = PageController(viewportFraction: 0.9);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double height = 250;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        log("current page value is " + _currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          child: PageView.builder(
              controller: pageController,
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return _buildPageItem(index);
              }),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue.toInt(),
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4
        .identity(); // Create a new identity matrix for transformations

// Check if the current page index is the same as the floor of _currPageValue
    if (index == _currPageValue.floor()) {
      // The current page is at the center of the PageView, so apply scaling to make it larger
      var currScale = 1 -
          (_currPageValue - index) *
              (1 - _scaleFactor); // Calculate scaling factor
      var currTrans = height *
          (1 - currScale) /
          2; // Calculate translation to center the page vertically
      matrix = Matrix4.diagonal3Values(
          1, currScale, 1) // Apply scaling along the Y-axis
        ..setTranslationRaw(0, currTrans, 0); // Apply vertical translation
    }
// Check if the next page index (index + 1) is the current page in the PageView
    else if (index == _currPageValue.floor() + 1) {
      // The next page is slightly scaled up as it approaches the center
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0); // Apply scaling and translation
    }
// Check if the previous page index (index - 1) is the current page in the PageView
    else if (index == _currPageValue.floor() - 1) {
      // The previous page is scaled similarly to the next page
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0); // Apply scaling and translation
    } else {
      // For pages that are further away from the center, scale them down
      var currScale = 0.8; // Apply a fixed scaling factor for distant pages
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, height * (1 - _scaleFactor) / 2,
            0); // Apply a vertical translation
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: height,
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(imageList[index]))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 140,
              margin: EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: titlesList[index],
                      color: AppColors.mainBlackColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SmallText(text: '4.5'),
                        SizedBox(
                          width: 10,
                        ),
                        SmallText(text: '1287 '),
                        SizedBox(
                          width: 3,
                        ),
                        SmallText(text: 'Comments'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          text: 'Normal',
                          iconcolor: AppColors.iconColor1,
                        ),
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          text: '1.7km',
                          iconcolor: AppColors.mainColor,
                        ),
                        IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          text: '32min',
                          iconcolor: AppColors.iconColor2,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
