import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
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
      try {
       
        if (event.name.isEmpty) {
          emit(NameEmpty());
           return; 
        }
        await auth.currentUser!.updateDisplayName(event.name);
        await auth.currentUser!.reload();
        emit(SaveButtonState());
      } on FirebaseException catch (e) {
        emit(SaveButtonFailState(message: e.message!));
      }
    });
  }
}
