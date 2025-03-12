// ignore_for_file: unused_field

class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<CartModel> _products;
  List<CartModel> get products => _products;
  Product(
      {required totalSize,
      required typeId,
      required offset,
      required products}) {
    _totalSize = totalSize;
    _offset = offset;
    _products = products;
    _typeId = typeId;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <CartModel>[];
      json['products'].forEach((v) {
        _products.add(CartModel.fromJson(v));
      });
    }
  }
}

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;

  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExist,
    this.time,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    time = json['time'];
    isExist = json['isExist'];
  }
}
