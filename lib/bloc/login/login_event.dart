import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginWithCred extends LoginEvent {
  final String email;
  final String password;

  LoginWithCred({this.email, this.password});
  @override
  // TODO: implement props
  List<Object> get props => [];
}
