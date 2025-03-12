import 'package:flutter/material.dart';
import 'package:snacksprite/utils/color.dart';
import 'package:snacksprite/utils/dimension.dart';
import 'package:snacksprite/pages/home/food_page_body.dart';
import 'package:snacksprite/widgets/big_text.dart';
import 'package:snacksprite/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: Dimension.height45, bottom: Dimension.height15),
          padding: EdgeInsets.only(
              left: Dimension.width20, right: Dimension.width20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  BigText(
                    text: "Jharkhand",
                    color: AppColors.mainColor,
                    size: 30,
                  ),
                  Row(
                    children: [
                      SmallText(
                        text: "Bokaro",
                        color: Colors.black,
                        size: 15,
                      ),
                      const Icon(Icons.arrow_drop_down_rounded)
                    ],
                  ),
                ],
              ),
              Center(
                child: Container(
                  width: Dimension.height45,
                  height: Dimension.height45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius15),
                      color: AppColors.mainColor),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: Dimension.iconSize24,
                  ),
                ),
              )
            ],
          ),
        ),
        const Expanded(
          child: SingleChildScrollView(
            child: FoodPageBody(),
          ),
        ),
      ],
    ));
  }
}
