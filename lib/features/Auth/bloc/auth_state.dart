part of 'auth_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoadingState extends LoginState {}

// ignore: must_be_immutable
class SuccessState extends LoginState {
  SuccessModel loginSuccessFluy;
  SuccessState({required this.loginSuccessFluy});
}

// ignore: must_be_immutable
class FialerState extends LoginState {
  FilerModel fialerWithLogin;
  FialerState({required this.fialerWithLogin});
}