part of 'market_bloc.dart';

@immutable
sealed class MarketState {}

final class MarketInitial extends MarketState {}

final class MoveToProductPageState extends MarketState {
  final ProductModel product;
  MoveToProductPageState({required this.product});
}

final class MarketLoaded extends MarketState {
  final List<CategoryModel> categoryList;
  final List<CartModel> cartItems;
  final double totalPrice;
  MarketLoaded({required this.categoryList, required this.totalPrice, required this.cartItems});
}

final class ChangeToQuantityState extends MarketState {}

final class QuantityToSquareState extends MarketState {}


