import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/dimensions.dart';
import 'package:flutter_application_2/core/widgets/app_icons.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.height10 * 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'assets/images/wallpaperflare.com_wallpaper (18).jpg'),
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height30 + 10,
            left: Dimensions.width10,
            right: Dimensions.width10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcons(icon: Icons.arrow_back_ios),
                AppIcons(
                  icon: Icons.shopping_cart_outlined,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
