import 'package:fitly/models/cart_model/cart_model.dart';
import 'package:fitly/models/category_model/product_model.dart';

class CartMarketRepository {
  CartMarketRepository._();
  static final CartMarketRepository instance = CartMarketRepository._();
  factory CartMarketRepository() => instance;

  List<CartModel> carts = [];

  List<CartModel> getCarts() {
    return carts;
  }

  void addToCart(ProductModel product) {
    int index = carts.indexWhere((e) => e.product.id == product.id);
    index != -1
        ? carts[index].quantity++
        : carts.add(CartModel(product: product, quantity: 1));
  }

  double totalPrice() {
    double totalPrice = carts.fold(
      0,
      (sum, p) => sum += p.quantity.toDouble() * p.product.price,
    );
    return double.parse(totalPrice.toStringAsFixed(2));
  }

  void removeFromCart(ProductModel product) {
    int index = carts.indexWhere((e) => e.product.id == product.id);

    if (index != -1) {
      carts[index].quantity > 1
          ? carts[index].quantity--
          : carts.removeAt(index);
    }
    
  }

  int quantity(ProductModel product) {
    return carts.firstWhere((e) => e.product.id == product.id).quantity;
  }

  CartModel? getProduct(ProductModel product) {
    int index = carts.indexWhere((e) => product.id == e.product.id);
    return index != -1 ? carts[index] : null;
  }
}
