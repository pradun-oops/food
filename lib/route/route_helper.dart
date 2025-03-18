// ignore_for_file: unnecessary_string_interpolations

import 'package:get/get.dart';
import 'package:snacksprite/pages/cart/cart_page.dart';
import 'package:snacksprite/pages/food/popular_food_detail.dart';
import 'package:snacksprite/pages/food/recommended_food_detail.dart';
import 'package:snacksprite/pages/home/home_page.dart';
import 'package:snacksprite/pages/splash/splash_screen.dart';

class RouteHelper {
  static const String splashScreen = '/splash-screen';
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getSplashScreen() => '$splashScreen';
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';

  static List<GetPage> route = [
    GetPage(
      name: initial,
      page: () => const HomePage(),
    ),
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: cartPage,
        page: () {
          return const CartPage();
        },
        transition: Transition.fadeIn),
  ];
}
