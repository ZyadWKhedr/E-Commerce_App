import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app_colors.dart';
import 'package:flutter_application_2/core/dimensions.dart';
import 'package:flutter_application_2/core/widgets/big_text.dart';
import 'package:flutter_application_2/core/widgets/icon_and_text_widget.dart';
import 'package:flutter_application_2/core/widgets/small_text.dart';

class DetailsColumn extends StatelessWidget {
  const DetailsColumn({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: 'Goju Satouto', color: AppColors.mainBlackColor),
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
}
