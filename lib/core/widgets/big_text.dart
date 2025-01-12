import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  BigText({
    super.key,
    required this.text,
    this.color = const Color(0xff89dad0),
    this.size = 20,
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
