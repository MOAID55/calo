import 'package:fitly/data/mock_data.dart';
import 'package:fitly/models/category_model/category_model.dart';

class MockRepository {
  MockRepository._();
  static final MockRepository _instance = MockRepository._();
  factory MockRepository() => _instance;

  final List<CategoryModel> category = MockData.categoriesJson
      .map((e) => CategoryModel.fromJson(e))
      .toList();

  List<CategoryModel> getCategories() {
    return category;
  }

  void incrementQuantity(int productIndex, String categoryName) {
    final specificCategory = category.firstWhere((e) => e.name == categoryName);
    final product = specificCategory.products[productIndex];
    if (product.quantity >= 0) {
      product.quantity++;
    }
  }

  void decrementQuantity(int productIndex, String categoryName) {
    final specificCategory = category.firstWhere((e) => e.name == categoryName);
    final product = specificCategory.products[productIndex];
    if (product.quantity > 0) {
      product.quantity--;
    }
  }
}
