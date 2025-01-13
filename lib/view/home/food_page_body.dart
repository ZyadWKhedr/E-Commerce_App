import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app_colors.dart';
import 'package:flutter_application_2/core/dimensions.dart';
import 'package:flutter_application_2/core/widgets/big_text.dart';
import 'package:flutter_application_2/core/widgets/icon_and_text_widget.dart';
import 'package:flutter_application_2/core/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final List<String> imageList = [
    'assets/images/wallpaperflare.com_wallpaper.jpg',
    'assets/images/bojack.jpg',
    'assets/images/wallpaperflare.com_wallpaper (18).jpg',
    'assets/images/wallpaperflare.com_wallpaper (20).jpg',
    'assets/images/wallpaperflare.com_wallpaper (29).jpg',
  ];

  final List<String> titlesList = [
    'Ichigo',
    'Bojack Horseman',
    'Gojo Satoru',
    'Ben 10',
    'Saitama',
  ];

  late PageController pageController;
  double _currentPage = 0.0;
  final double _scaleFactor = 0.8;
  final double height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.9);
    pageController.addListener(() {
      setState(() {
        _currentPage = pageController.page!;
        log("current page value is $_currentPage");
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPageView(),
        _buildDotsIndicator(),
        SizedBox(height: Dimensions.height30),
        _buildPopularHeader(),
        _buildFoodList(),
      ],
    );
  }

  Widget _buildPageView() {
    return Container(
      height: Dimensions.pageView,
      child: PageView.builder(
        controller: pageController,
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return _buildPageItem(index);
        },
      ),
    );
  }

  Widget _buildDotsIndicator() {
    return DotsIndicator(
      dotsCount: imageList.length,
      position: _currentPage.toInt(),
      decorator: DotsDecorator(
        activeColor: AppColors.mainColor,
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }

  Widget _buildPopularHeader() {
    return Container(
      margin: EdgeInsets.only(left: Dimensions.width10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BigText(text: 'Popular'),
          SizedBox(width: Dimensions.width10),
          _buildDotSeparator(),
          SizedBox(width: Dimensions.width10),
          SmallText(
            text: 'Food Pairing',
            color: Colors.black38,
          ),
        ],
      ),
    );
  }

  Widget _buildDotSeparator() {
    return Container(
      margin: const EdgeInsets.only(bottom: 3),
      child: BigText(
        text: '.',
        color: Colors.black26,
      ),
    );
  }

  Widget _buildFoodList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return _buildFoodItem(index);
      },
    );
  }

  Widget _buildFoodItem(int index) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.width10 / 2,
        top: Dimensions.height10 / 2,
      ),
      child: Row(
        children: [
          _buildFoodImage(index),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 3),
              child: _buildFoodDetails(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodImage(int index) {
    return Container(
      height: Dimensions.height30 * 4,
      width: Dimensions.width30 * 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        color: Colors.amber,
        image: DecorationImage(
          image: AssetImage(imageList[index]),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildFoodDetails(int index) {
    return Container(
      height: Dimensions.height10 * 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(Dimensions.radius10),
          bottomRight: Radius.circular(Dimensions.radius10),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildFoodInfo(index),
      ),
    );
  }

  Widget _buildFoodInfo(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: titlesList[index],
          color: AppColors.mainBlackColor,
        ),
        SizedBox(height: Dimensions.height10),
        _buildRatingRow(),
        SizedBox(height: Dimensions.height10),
        _buildAdditionalInfoRow(),
      ],
    );
  }

  Widget _buildRatingRow() {
    return Row(
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
        SizedBox(width: Dimensions.width10),
        SmallText(text: '4.5'),
        SizedBox(width: Dimensions.width10),
        SmallText(text: '1287 '),
        SizedBox(width: Dimensions.width10 * (3 / 10)),
        SmallText(text: 'Comments'),
      ],
    );
  }

  Widget _buildAdditionalInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconAndTextWidget(
          icon: Icons.circle_sharp,
          text: 'Normal',
          iconcolor: AppColors.iconColor1,
          size: Dimensions.iconSize24 / 2,
        ),
        IconAndTextWidget(
          icon: Icons.location_on,
          text: '1.7km',
          iconcolor: AppColors.mainColor,
          size: Dimensions.iconSize24 / 2,
        ),
        IconAndTextWidget(
          icon: Icons.circle_sharp,
          text: '32min',
          iconcolor: AppColors.iconColor2,
          size: Dimensions.iconSize24 / 2,
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();

    if (index == _currentPage.floor()) {
      // The current page is at the center of the PageView, so apply scaling to make it larger
      var currScale = 1 -
          (_currentPage - index) *
              (1 - _scaleFactor); // Calculate scaling factor
      var currTrans = height *
          (1 - currScale) /
          2; // Calculate translation to center the page vertically
      matrix = Matrix4.diagonal3Values(
          1, currScale, 1) // Apply scaling along the Y-axis
        ..setTranslationRaw(0, currTrans, 0); // Apply vertical translation
    }
    // Check if the next page index (index + 1) is the current page in the PageView
    else if (index == _currentPage.floor() + 1) {
      // The next page is slightly scaled up as it approaches the center
      var currScale =
          _scaleFactor + (_currentPage - index + 1) * (1 - _scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0); // Apply scaling and translation
    }
    // Check if the previous page index (index - 1) is the current page in the PageView
    else if (index == _currentPage.floor() - 1) {
      // The previous page is scaled similarly to the next page
      var currScale = 1 - (_currentPage - index) * (1 - _scaleFactor);
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
          _buildPageItemContainer(index),
          _buildPageItemTextContainer(index),
        ],
      ),
    );
  }

  Widget _buildPageItemContainer(int index) {
    return Container(
      height: Dimensions.pageViewContainer,
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imageList[index]),
        ),
      ),
    );
  }

  Widget _buildPageItemTextContainer(int index) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: Dimensions.pageViewTextContainer,
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
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
        child: _buildPageItemInfo(index),
      ),
    );
  }

  Widget _buildPageItemInfo(int index) {
    return Container(
      width: Dimensions.width30 * 5,
      padding: EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: titlesList[index], color: AppColors.mainBlackColor),
          SizedBox(height: Dimensions.height10),
          _buildRatingRow(),
          SizedBox(height: Dimensions.height10),
          _buildAdditionalInfoRow(),
        ],
      ),
    );
  }
}
