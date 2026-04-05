import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => firebaseAuth.currentUser;

  Future<bool> isLogging() async {
    if (currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  //------                 to sign in ----------------------------------
  Future<Either<String, User?>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user != null
          ? Right(userCredential.user)
          : Left("User not Sign in , try again");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "wrong-password":
          return Left("Email or password is incorrect");
        case "network-request-failed":
          return Left("Check your internet Connection");
        case "too-many-requests":
          return Left("Too many attempts. Try again later");
        default:
          return Left("Password Or Email is incorrect");
      }
    }
  }

  //------------------------------------------------ create account ------------------------

  Future<Either<String, bool>> createAccount({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential credential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(name);
      await credential.user!.reload();

      return Right(true);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "network-request-failed":
          return Left("Check your internet connection");

        case "email-already-in-use":
          return Left("This email is already registered");

        default:
          return Left("Something Went Wrong / Try Again");
      }
    }
  }

  // ------------------------------------ update userName ------------------------------------------

  Future<Either<String, bool>> updateNameUser(String newName) async {
    try {
      await currentUser!.updateDisplayName(newName);
      await currentUser!.reload();

      return Right(true);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "network-request-failed":
          return Left("Check your Connection");
        default:
          return Left("Something is Went wrong try Again");
      }
    }
  }

  // ------------------------------------ update signOut--------------

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
