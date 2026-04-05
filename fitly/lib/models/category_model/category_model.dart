

import 'package:fitly/models/category_model/product_model.dart';

class CategoryModel {
  final String name;
  final List<ProductModel> products;
  CategoryModel({required this.name, required this.products});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      products: (json['products'] as List)
          .map((p) => ProductModel.fromJson(p))
          .toList(),
    );
  }
}
