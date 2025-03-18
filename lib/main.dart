import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snacksprite/controller/cart_controller.dart';
import 'package:snacksprite/controller/popular_product_controller.dart';
import 'package:snacksprite/controller/recommended_product_controller.dart';
import 'package:snacksprite/route/route_helper.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(
      builder: (_) {
        return GetBuilder<RecommendedProductController>(builder: (_) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RouteHelper.splashScreen,
            getPages: RouteHelper.route,
          );
        });
      },
    );
  }
}
