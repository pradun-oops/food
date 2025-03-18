// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:snacksprite/models/cart_model.dart';
import 'package:snacksprite/utils/app_constants.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> carts = [];
  void addToCartList(List<CartModel> cartlist) {
    carts = [];

    cartlist.forEach((element) => carts.add(jsonEncode(element)));
    sharedPreferences.setStringList(AppConstants.CART_LIST, carts);
  }

  List<CartModel> getCartList() {
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
    }

    List<CartModel> cartList = [];

    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));
    return cartList;
  }
}
