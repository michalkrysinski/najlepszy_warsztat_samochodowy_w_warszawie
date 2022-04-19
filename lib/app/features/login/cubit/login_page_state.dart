part of 'login_page_cubit.dart';

@immutable
class LoginPageState {
  final String errorMessage;
  final bool isCreatingAccount;

  const LoginPageState({
    required this.errorMessage,
    required this.isCreatingAccount,
  });
}
