import 'package:bloc/bloc.dart';
import 'package:fitly/data/repo/cart_repository.dart';
import 'package:fitly/data/repo/mock_repository.dart';
import 'package:fitly/models/cart_model/cart_model.dart';
import 'package:fitly/models/category_model/category_model.dart';
import 'package:fitly/models/category_model/product_model.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'market_event.dart';
part 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  final repo = MockRepository();
  final cart = GetIt.I.get<CartMarketRepository>();

  MarketBloc() : super(MarketInitial()) {
    on<LoadCategoryEvent>((event, emit) {
      emit(
        (MarketLoaded(
          categoryList: repo.getCategories(),
          totalPrice: 0.0,
          cartItems: cart.carts,
        )),
      );
    });

    on<IncrementQuantityEvent>((event, emit) {
      repo.incrementQuantity(event.productIndex, event.product.category);
      cart.addToCart(event.product);
      emit(
        MarketLoaded(
          categoryList: repo.getCategories(),
          totalPrice: double.parse(cart.totalPrice().toString()),
          cartItems: cart.carts,
        ),
      );
    });

    on<DecrementQuantityEvent>((event, emit) {
      repo.decrementQuantity(event.productIndex, event.product.category);
      cart.removeFromCart(event.product);
      emit(
        (MarketLoaded(
          categoryList: repo.getCategories(),
          totalPrice: double.parse(cart.totalPrice().toString()),
          cartItems: cart.carts,
        )),
      );
    });

    on<MoveToProductPageEvent>((event, emit) {
      emit(MoveToProductPageState(product: event.product));
    });
  }
}
