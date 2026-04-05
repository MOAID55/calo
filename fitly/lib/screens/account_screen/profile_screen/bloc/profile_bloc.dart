import 'package:bloc/bloc.dart';
import 'package:fitly/core/services/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final auth = GetIt.I<AuthService>();
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});

    on<LoadDataProfileEvent>((event, emit) {
      String? nameUser = auth.currentUser!.displayName!;
      String emailUser = auth.currentUser!.email!;
      emit(LoadDataProfileState(name: nameUser, email: emailUser));
    });

    on<SaveButtonEvent>((event, emit) async {
      if (event.name.isEmpty) {
        emit(NameEmpty());
        return;
      }
      
      final checkSuccessfulChange = await auth.updateNameUser(event.name);

      checkSuccessfulChange.fold(
        (onLeft) {
          emit(SaveButtonFailState(message: onLeft));
        },
        (onRight) {
          emit(SaveButtonState());
        },
      );
    });
  }
}
