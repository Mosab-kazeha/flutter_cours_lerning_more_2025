import 'package:bloc/bloc.dart';
import 'package:bloc_secion/Auth/model/base_model.dart';
import 'package:bloc_secion/Auth/model/user_model.dart';
import 'package:bloc_secion/Auth/service/login_service.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

String token = "";

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<UserLogginIn>((event, emit) async {
      emit(LoadingState());

      BaseModel temp = await LoginService(dio: Dio()).login(user: event.user);

      if (temp is SuccessModel) {
        token = temp.accessToken;
        emit(SuccessState(loginSuccessFluy: temp));
      }

      if (temp is FilerModel) {
        emit(FialerState(fialerWithLogin: temp));
      }
    });
  }
}
