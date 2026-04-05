import 'package:bloc/bloc.dart';
import 'package:fitly/core/services/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) {});
    on<AppearLogoEvent>((event, emit) async {
      final user = GetIt.I.get<AuthService>().currentUser;

      await Future.delayed(Duration(seconds: 2));
      emit(AppearLogoState());
      await Future.delayed(Duration(seconds: 1));
      if (user != null) {
        emit(AlreadySignInState());
      } else {
        emit(LoginPageState());
      }
    });
  }
}
