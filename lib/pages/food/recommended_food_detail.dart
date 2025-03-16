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
import 'package:snacksprite/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const RecommendedFoodDetail(
      {super.key, required this.pageId, required this.page});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (page == 'cartpage') {
                      Get.toNamed(RouteHelper.cartPage);
                    } else {
                      Get.toNamed(RouteHelper.getInitial());
                    }
                  },
                  child: const AppIcon(
                    icon: Icons.clear,
                  ),
                ),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return Stack(
                    children: [
                      GestureDetector(
                          onTap: () {
                            if (controller.totalItems >= 1) {
                              Get.toNamed(RouteHelper.cartPage);
                            }
                          },
                          child: const AppIcon(
                              icon: Icons.shopping_cart_outlined)),
                      controller.totalItems >= 1
                          ? const Positioned(
                              right: 0,
                              top: 0,
                              child: AppIcon(
                                icon: Icons.circle,
                                size: 20,
                                iconColor: Colors.transparent,
                                backgroundColor: AppColors.mainColor,
                              ),
                            )
                          : Container(),
                      Get.find<PopularProductController>().totalItems >= 1
                          ? Positioned(
                              right: 5,
                              top: 1,
                              child: BigText(
                                text: Get.find<PopularProductController>()
                                    .totalItems
                                    .toString(),
                                size: 13,
                                color: Colors.black,
                              ),
                            )
                          : Container(),
                    ],
                  );
                }),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        Dimension.radius20,
                      ),
                      topRight: Radius.circular(Dimension.radius20)),
                ),
                width: double.maxFinite,
                padding: const EdgeInsets.only(
                  top: 5,
                  bottom: 10,
                ),
                child: Center(
                  child: BigText(
                    text: product.name!,
                    size: Dimension.font26,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimension.width20,
                    right: Dimension.width20,
                  ),
                  child: ExpandableTextWidget(
                    text: product.description!,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimension.width20 * 2.5,
                right: Dimension.width20 * 2.5,
                top: Dimension.height10,
                bottom: Dimension.height10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(false);
                    },
                    child: AppIcon(
                      icon: Icons.remove,
                      backgroundColor: AppColors.mainColor,
                      iconColor: Colors.white,
                      iconSize: Dimension.iconSize24,
                    ),
                  ),
                  BigText(
                    text: "₹${product.price!}  X  ${controller.inCartItems}",
                    color: AppColors.mainBlackColor,
                    size: Dimension.font26,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(true);
                    },
                    child: AppIcon(
                      icon: Icons.add,
                      backgroundColor: AppColors.mainColor,
                      iconColor: Colors.white,
                      iconSize: Dimension.iconSize24,
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
                    child: const Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimension.height15,
                          bottom: Dimension.height15,
                          left: Dimension.width20,
                          right: Dimension.width20),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimension.radius20),
                          color: AppColors.mainColor),
                      child: BigText(
                        text: "₹${product.price!} | Add to cart",
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
