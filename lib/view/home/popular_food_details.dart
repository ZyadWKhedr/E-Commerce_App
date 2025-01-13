import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app_colors.dart';
import 'package:flutter_application_2/core/dimensions.dart';
import 'package:flutter_application_2/core/widgets/app_icons.dart';
import 'package:flutter_application_2/core/widgets/big_text.dart';
import 'package:flutter_application_2/core/widgets/icon_and_text_widget.dart';
import 'package:flutter_application_2/core/widgets/small_text.dart';
import 'package:flutter_application_2/view/home/widgets/details_column.dart';

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
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.height10 * 37,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height10,
              ),
              height: MediaQuery.of(context).size.height,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 1.5),
                  topRight: Radius.circular(Dimensions.radius20 * 1.5),
                ),
                color: Colors.white,
              ),
              child: DetailsColumn(
                text: 'Goju Satouro',
              ),
            ),
          )
        ],
      ),
    );
  }
}
