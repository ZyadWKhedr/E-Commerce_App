import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/dimensions.dart';

class AppIcons extends StatelessWidget {
  const AppIcons(
      {super.key,
      required this.icon,
      this.color = const Color(0xFFfcf4e4),
      this.size = 40,
      this.backgroundColor = const Color(0xFF756d54)});

  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2), color: color),
      child: Icon(
        icon,
        color: backgroundColor,
        size: Dimensions.iconSize24 / 1.7,
      ),
    );
  }
}
