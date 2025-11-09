part of 'auth_bloc.dart';

@immutable
sealed class LoginEvent {}

// ignore: must_be_immutable
class UserLogginIn extends LoginEvent {
  UserModel user;
  UserLogginIn({required this.user});
}