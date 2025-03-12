import 'package:flutter/material.dart';
import 'package:snacksprite/utils/dimension.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText({
    super.key,
    this.color = const Color(0xFF332d2b),
    this.size = 0,
    required this.text,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontFamily: 'Roboto',
        fontSize: size == 0 ? Dimension.font20 : size,
      ),
      overflow: overflow,
    );
  }
}
