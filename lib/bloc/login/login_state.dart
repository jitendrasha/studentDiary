import 'package:equatable/equatable.dart';
import 'package:flutterapp/models/user.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class InitialLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginLoadingFail extends LoginState {
  final String reason;

  LoginLoadingFail({this.reason});
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginDone extends LoginState {
  
  @override
  // TODO: implement props
  List<Object> get props => [];
}
