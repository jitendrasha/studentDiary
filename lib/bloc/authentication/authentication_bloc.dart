import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:meta/meta.dart';
import 'package:flutterapp/models/user.dart';
import 'package:flutterapp/services/user_repository.dart';

import 'bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    _userRepository.playingWithDb();
    try {
      final isSignedIn = await _userRepository.isSignedIn();
      if (isSignedIn) {
       final  user = await _userRepository.getCurrentUser();

  final userDetails = await _userRepository.getCurrentUserDetail(user.uid);
    yield Authenticated(userDetails);
      } else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
   final  user = await _userRepository.getCurrentUser();
  //  final role = await _userRepository.getRoleId();

  final userDetails = await _userRepository.getCurrentUserDetail(user.uid);
    yield Authenticated(userDetails);
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    _userRepository.signOut();
    yield Unauthenticated();
  }
}
