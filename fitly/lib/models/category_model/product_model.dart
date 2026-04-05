import 'package:fitly/models/category_model/nutrition_model.dart';

class ProductModel {
  final int id;
  final String name;
  final String plan;
  final String category;
  final String image;
  final double price;
  final String currency;
  final NutritionModel nutrition;
  int quantity;

  ProductModel({
    required this.id,
    required this.name,
    required this.plan,
    required this.category,
    required this.image,
    required this.price,
    required this.currency,
    required this.nutrition,
    this.quantity = 0,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      plan: json['plan'],
      category: json['category'],
      image: json['image'],
      price: json['price'],
      currency: json['currency'],
      nutrition: NutritionModel.fromJson(json['nutrition']),
    );
  }
}
