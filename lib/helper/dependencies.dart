import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snacksprite/controller/cart_controller.dart';
import 'package:snacksprite/controller/popular_product_controller.dart';
import 'package:snacksprite/controller/recommended_product_controller.dart';
import 'package:snacksprite/data/api/api_client.dart';
import 'package:snacksprite/data/repository/cart_repo.dart';
import 'package:snacksprite/data/repository/popular_product_repo.dart';
import 'package:snacksprite/data/repository/recommended_product_repo.dart';
import 'package:snacksprite/utils/app_constants.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
