import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  SmallText({
    super.key,
    required this.text,
    this.color = const Color(0xff332d2b),
    this.size = 12,
    this.overFlow = TextOverflow.ellipsis,
  });

  final String text;
  final Color color;
  double size;
  TextOverflow overFlow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto'),
      overflow: overFlow,
    );
  }
}
