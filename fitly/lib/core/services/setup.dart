import 'package:fitly/core/services/auth_service.dart';
import 'package:fitly/data/repo/cart_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerLazySingleton<CartMarketRepository>(
    () => CartMarketRepository(),
  );
}
