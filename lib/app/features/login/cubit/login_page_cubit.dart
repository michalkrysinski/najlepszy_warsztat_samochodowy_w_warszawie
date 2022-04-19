import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit()
      : super(const LoginPageState(
          errorMessage: "",
          isCreatingAccount: false,
        ));
  Future<void> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, 
        password: password,
      );
    } catch (error) {
      emit(LoginPageState(
        errorMessage: error.toString(),
        isCreatingAccount: false,
      ));
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (error) {
      emit(LoginPageState(
        errorMessage: error.toString(),
        isCreatingAccount: false,
      ));
    }
  }

  Future<void> start() async {
    emit(
      const LoginPageState(
        isCreatingAccount: false,
        errorMessage: "",
      ),
    );
  }

  Future<void> setState() async {
    emit(
      const LoginPageState(
        isCreatingAccount: true,
        errorMessage: "",
      ),
    );
  }
}
