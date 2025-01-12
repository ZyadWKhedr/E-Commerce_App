import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  const IconAndTextWidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconcolor,
      this.color = const Color(0xff332d2b)});

  final IconData icon;
  final String text;
  final Color color;
  final Color iconcolor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconcolor,
          ),
          SizedBox(
            width: 0.5,
          ),
          SmallText(
            color: color,
            text: text,
          )
        ],
      ),
    );
  }
}
