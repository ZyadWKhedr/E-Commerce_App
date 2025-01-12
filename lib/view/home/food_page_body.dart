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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
          controller: pageController,
          itemCount: imageList.length,
          itemBuilder: (context, index) {
            return _buildPageItem(index);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        Container(
          height: 250,
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
                  spreadRadius: 2,
                  blurRadius: 7,
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
    );
  }
}
