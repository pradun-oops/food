import 'package:flutter/material.dart';
import 'package:snacksprite/utils/dimension.dart';
import 'package:snacksprite/widgets/small_text.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  final Color iconColor;
  const IconTextWidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimension.iconSize24,
        ),
        SmallText(
          text: text,
        ),
      ],
    );
  }
}
