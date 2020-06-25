import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/screens/admin_home.dart';
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
          //? yaha user app open krta h 
          if (state is Uninitialized) {
            //! yaha app start hui h aur hum user ko splash screen dikha rhe h
            //!background me user check krte h
            //! yaha pe tu apne collage ka logo bhbi dikha sakta h
            return Container(
              color: Colors.blueAccent,
              constraints: BoxConstraints.expand(),
            );
          }
          //? yaha user login nhi h
          if (state is Unauthenticated) {
            //! yaha hum user login screen dikha rhe h

            return BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(
                  repo: RepositoryProvider.of<UserRepository>(context)),
              child: LoginScreen(),
            );
          }
          //? yaha user authenticated h
          if (state is Authenticated) {
            //! yaha pr route kra rhe h user ko different homepage pr according to his role
            print(state.user.roleId);
            //? yaha hum role check kr rhe h
            if(state.user.roleId=="Student"){
              //? student h to student dash board dikha rhe h
               return BlocProvider(
                create: (context) =>
                    SubjectBloc(RepositoryProvider.of<UserRepository>(context))
                      ..add(LoadSubjects()),
                child: DashBoard(
                  user: state.user,
                ));
            }else if(state.user.roleId=="Admin"){
              //? admon h to admin dashbord dikha rhe h
              return AdminHome();
            }
            
           
          }
          return Container();
        },
      ),
    );
  }
}
