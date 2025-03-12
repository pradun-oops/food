import 'package:flutter/material.dart';
import 'package:snacksprite/utils/color.dart';
import 'package:snacksprite/utils/dimension.dart';
import 'package:snacksprite/widgets/app_icon.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            height: Dimension.height20 * 6,
            left: Dimension.width20,
            right: Dimension.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimension.iconSize24,
                ),
                SizedBox(
                  width: Dimension.width20 * 10,
                ),
                AppIcon(
                  icon: Icons.home_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimension.iconSize24,
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimension.iconSize24,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
