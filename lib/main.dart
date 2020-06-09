import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/screens/dashboard.dart';

import 'bloc/authentication/authentication_bloc.dart';
import 'bloc/authentication/authentication_event.dart';
import 'bloc/authentication/authentication_state.dart';
import 'bloc/login/login_bloc.dart';
import 'bloc/student/bloc.dart';
import 'bloc_delegate.dart';
import 'screens/login_screen.dart';
import 'services/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //for monitor bloc
  BlocSupervisor.delegate = AppBlocDelegate();
  final UserRepository userRepository = UserRepository();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(RepositoryProvider(
      create: (context) => UserRepository(),
      child: BlocProvider(
        create: (context) => AuthenticationBloc(
            userRepository: context.repository<UserRepository>())
          ..add(AppStarted()),
        child: App(),
      ),
    ));
  });
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder(
        bloc: BlocProvider.of<AuthenticationBloc>(context),
        builder: (BuildContext context, AuthenticationState state) {
          if (state is Uninitialized) {
            return Container(
              color: Colors.blueAccent,
              constraints: BoxConstraints.expand(),
            );
          }
          if (state is Unauthenticated) {
            return BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(
                  repo: RepositoryProvider.of<UserRepository>(context)),
              child: LoginScreen(),
            );
          }
          if (state is Authenticated) {
            print(state.user.toString());
            return BlocProvider(
                create: (context) =>
                    SubjectBloc(RepositoryProvider.of<UserRepository>(context))
                      ..add(LoadSubjects()),
                child: DashBoard(
                  user: state.user,
                ));
          }
          return Container();
        },
      ),
    );
  }
}
