part of 'market_bloc.dart';

@immutable
sealed class MarketEvent {}

final class LoadCategoryEvent extends MarketEvent {}

final class MoveToProductPageEvent extends MarketEvent {
  final ProductModel product;
  MoveToProductPageEvent({required this.product});
}

final class IncrementQuantityEvent extends MarketEvent {
  final int productIndex;
  final ProductModel product;
  IncrementQuantityEvent({
    required this.productIndex,
    required this.product,
  });
}

final class DecrementQuantityEvent extends MarketEvent {
  final int productIndex;
  final ProductModel product;
  DecrementQuantityEvent({
    required this.productIndex,
    required this.product,
  });
}
