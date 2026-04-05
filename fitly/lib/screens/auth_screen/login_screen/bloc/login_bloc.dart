import 'package:bloc/bloc.dart';
import 'package:fitly/core/services/auth_service.dart';
import 'package:fitly/core/services/setup.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});

    on<LoginButtonEvent>((event, emit) async {
      final auth = getIt<AuthService>();

      final user = await auth.signIn(
        email: event.email,
        password: event.password,
      );

      user.fold(
        (onLeft) {
          emit(LoginButtonErrorState(errorMessage: onLeft));
        },
        (onRight) {
          emit(LoginButtonSuccessfullyState());
        },
      );
      
    });

    on<RegisterButtonEvent>((event, emit) {
      emit(RegisterButtonState());
    });
  }
}
