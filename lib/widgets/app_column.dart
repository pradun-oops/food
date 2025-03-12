import 'package:flutter/material.dart';
import 'package:snacksprite/utils/color.dart';
import 'package:snacksprite/utils/dimension.dart';
import 'package:snacksprite/widgets/big_text.dart';
import 'package:snacksprite/widgets/icon_text_widget.dart';
import 'package:snacksprite/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimension.font26,
          color: Colors.black54,
        ),
        SizedBox(
          height: Dimension.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => const Icon(
                  Icons.star,
                  size: 15,
                  color: AppColors.mainColor,
                ),
              ),
            ),
            SizedBox(
              width: Dimension.width10,
            ),
            SmallText(
              text: "4.5",
              size: 15,
            ),
            SizedBox(
              width: Dimension.width10,
            ),
            SmallText(
              text: "1163 comments",
              size: 15,
            ),
          ],
        ),
        SizedBox(
          height: Dimension.height15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const IconTextWidget(
                icon: Icons.circle_sharp,
                text: 'Noraml',
                iconColor: AppColors.iconColor1),
            SizedBox(
              width: Dimension.width10,
            ),
            const IconTextWidget(
              icon: Icons.location_on,
              text: '1.8km',
              iconColor: AppColors.mainColor,
            ),
            SizedBox(
              width: Dimension.width10,
            ),
            const IconTextWidget(
                icon: Icons.access_time_rounded,
                text: '53min',
                iconColor: AppColors.iconColor2),
          ],
        ),
      ],
    );
  }
}
