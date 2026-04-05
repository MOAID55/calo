
import 'package:fitly/models/category_model/macros_model.dart';

class NutritionModel {
  final int totalCalories;
  final int caloriesPerServing;
  final MacrosModel macros;
  NutritionModel({
    required this.totalCalories,
    required this.caloriesPerServing,
    required this.macros,
  });

  factory NutritionModel.fromJson(Map<String, dynamic> json) {
    return NutritionModel(
      caloriesPerServing: json['caloriesPerServing'],
      macros: MacrosModel.fromJson(json['macros']),
      totalCalories: json['totalCalories'],
    );
  }
}
