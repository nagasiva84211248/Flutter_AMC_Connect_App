import 'package:amc_connect/views/login/login_cubit.dart';

abstract class LoginState {}

class InitLoginState extends LoginState{}

class LoadingLoginState extends LoginState{}

class ResponscLoginState extends LoginState{
    final dynamic responce;
  ResponscLoginState({required this.responce});
}

class ErrorLoginState extends LoginState{
    final dynamic message;
  ErrorLoginState({required this.message});
}



