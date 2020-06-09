import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/models/user.dart';
import 'package:flutterapp/services/user_repository.dart';
import 'bloc.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository repo;

  LoginBloc({@required this.repo});
  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    // TODO: Add Logic
    if (event is LoginWithCred) {
      yield* _mapLoginWithCredToState(event);
    }
  }

  Stream<LoginState> _mapLoginWithCredToState(LoginWithCred event) async* {
    try {
      yield LoginLoading();
   await repo.signInWithCredentials(event.email, event.password);
//      await repo.signUp(email: event.email, password: event.password);
      yield LoginDone();
    } on PlatformException catch (e) {
      print(e);
      yield LoginLoadingFail(reason: e.message);
    }
  }
}
