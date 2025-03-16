import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snacksprite/controller/cart_controller.dart';
import 'package:snacksprite/controller/popular_product_controller.dart';
import 'package:snacksprite/controller/recommended_product_controller.dart';
import 'package:snacksprite/route/route_helper.dart';
import 'package:snacksprite/utils/app_constants.dart';
import 'package:snacksprite/utils/color.dart';
import 'package:snacksprite/utils/dimension.dart';
import 'package:snacksprite/widgets/app_icon.dart';
import 'package:snacksprite/widgets/big_text.dart';
import 'package:snacksprite/widgets/small_text.dart';

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
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.initial);
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimension.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimension.iconSize24,
                )
              ],
            ),
          ),
          Positioned(
            top: Dimension.height20 * 5,
            left: Dimension.width20,
            right: Dimension.width20,
            bottom: 0,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: GetBuilder<CartController>(
                builder: (cartController) {
                  var _cartList = cartController.getItems;
                  return ListView.builder(
                    itemCount: _cartList.length,
                    itemBuilder: (_, index) {
                      return SizedBox(
                        height: Dimension.height20 * 5,
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                var popularIndex =
                                    Get.find<PopularProductController>()
                                        .popularProductList
                                        .indexOf(_cartList[index].product!);
                                if (popularIndex >= 0) {
                                  Get.toNamed(RouteHelper.getPopularFood(
                                      popularIndex, "cartpage"));
                                } else {
                                  var recommendedIndex =
                                      Get.find<RecommendedProductController>()
                                          .recommendedProductList
                                          .indexOf(_cartList[index].product!);
                                  Get.toNamed(RouteHelper.getRecommendedFood(
                                      recommendedIndex, "cartpage"));
                                }
                              },
                              child: Container(
                                margin:
                                    EdgeInsets.only(bottom: Dimension.height10),
                                width: Dimension.height20 * 5,
                                height: Dimension.height20 * 5,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Dimension.radius20),
                                  image: DecorationImage(
                                      image: NetworkImage(AppConstants
                                              .BASE_URL +
                                          AppConstants.UPLOAD_URL +
                                          cartController.getItems[index].img!),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Dimension.width10,
                            ),
                            Expanded(
                                child: SizedBox(
                              height: Dimension.height20 * 5,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(
                                    text: cartController.getItems[index].name!,
                                    color: Colors.black87,
                                  ),
                                  SmallText(
                                      text:
                                          _cartList[index].quantity.toString()),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(
                                        text:
                                            "₹${cartController.getItems[index].price.toString()}",
                                        color: Colors.black45,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          top: Dimension.height10,
                                          bottom: Dimension.height10,
                                          left: Dimension.width20,
                                          right: Dimension.width20,
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              Dimension.radius20,
                                            ),
                                            color: Colors.white),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                cartController.addItem(
                                                    _cartList[index].product!,
                                                    -1);
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                color: AppColors.signColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: Dimension.width10 / 2,
                                            ),
                                            BigText(
                                              // text: popularproduct.inCartItems.toString(),
                                              text: _cartList[index]
                                                  .quantity
                                                  .toString(),
                                              color: Colors.black54,
                                            ),
                                            SizedBox(
                                              width: Dimension.width10 / 2,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                cartController.addItem(
                                                    _cartList[index].product!,
                                                    1);
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                color: AppColors.signColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularproduct) {
          return Container(
            height: Dimension.bottomHeightBar,
            padding: EdgeInsets.only(
              left: Dimension.width20,
              right: Dimension.width20,
              top: Dimension.height30,
              bottom: Dimension.height30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimension.radius20 * 2),
                topRight: Radius.circular(Dimension.radius20 * 2),
              ),
              color: AppColors.buttonBackgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: Dimension.height15,
                    bottom: Dimension.height15,
                    left: Dimension.width20,
                    right: Dimension.width20,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimension.radius20,
                      ),
                      color: Colors.white),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          popularproduct.setQuantity(false);
                        },
                        child: const Icon(
                          Icons.remove,
                          color: AppColors.signColor,
                        ),
                      ),
                      SizedBox(
                        width: Dimension.width10 / 2,
                      ),
                      BigText(
                        text: popularproduct.inCartItems.toString(),
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: Dimension.width10 / 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          popularproduct.setQuantity(true);
                        },
                        child: const Icon(
                          Icons.add,
                          color: AppColors.signColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimension.height15,
                      bottom: Dimension.height15,
                      left: Dimension.width20,
                      right: Dimension.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius20),
                      color: AppColors.mainColor),
                  child: GestureDetector(
                    onTap: () {},
                    child: BigText(
                      text: "₹${250} | Add to cart",
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
