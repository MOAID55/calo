class MacrosModel {
  final double protein;
  final double carbs;
  final double fat;
  final double saturatedFat;
  final double transFat;
  final double cholesterol;
  final double fiber;
  final double sugar;
  final double sodium;

  MacrosModel({
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.saturatedFat,
    required this.transFat,
    required this.cholesterol,
    required this.fiber,
    required this.sugar,
    required this.sodium,
  });

  factory MacrosModel.fromJson(Map<String, dynamic> json) {
    return MacrosModel(
      protein: double.parse(json['protein'].toString()),
      carbs: double.parse(json['carbs'].toString()),
      fat: double.parse(json['fat'].toString()),
      saturatedFat: double.parse(json['saturatedFat'].toString()),
      transFat: double.parse(json['transFat'].toString()),
      cholesterol: double.parse(json['cholesterol'].toString()),
      fiber: double.parse(json['fiber'].toString()),
      sodium: double.parse(json['sodium'].toString()),
      sugar: double.parse(json['sugar'].toString()),
    );
  }

  Map<String,double> get asMap => {
    "protein": protein,
    "carbs": carbs,
    "fat": fat,
    "saturatedFat": saturatedFat,
    "transFat": transFat,
    "cholesterol": cholesterol,
    "fiber": fiber,
    "sodium": sodium,
    "sugar": sugar,
  };

}
