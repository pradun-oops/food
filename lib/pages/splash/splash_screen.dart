import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snacksprite/controller/popular_product_controller.dart';
import 'package:snacksprite/controller/recommended_product_controller.dart';
import 'package:snacksprite/route/route_helper.dart';
import 'package:snacksprite/utils/dimension.dart';
import 'package:snacksprite/widgets/app_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    super.initState();
    _loadResources();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    );
    goToHomePage();
  }

  void goToHomePage() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );
    Get.offNamed(RouteHelper.initial);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/splash_bg.png"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: animation,
              child: Center(
                child: CircleAvatar(
                  radius: 125,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/image/app_logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimension.height20,
            ),
            const AppName(),
          ],
        ),
      ),
    );
  }
}
