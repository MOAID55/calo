import 'package:fitly/models/category_model/product_model.dart';

class CartModel {
  final ProductModel product;
  int quantity;
  CartModel({required this.product, required this.quantity});
}
