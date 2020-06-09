import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/bloc/authentication/authentication_bloc.dart';
import 'package:flutterapp/bloc/authentication/bloc.dart';
import 'package:flutterapp/bloc/login/bloc.dart';
import 'package:flutterapp/utils/validators.dart';


class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthenticationBloc>(context);
    return BlocListener(
      bloc: BlocProvider.of<LoginBloc>(context),
      listener: (context, state) {
        if (state is LoginLoading) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Loading...."),
                    CircularProgressIndicator()
                  ],
                ),
              ),
            );
        } else if (state is LoginLoadingFail) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text("${state.reason}"),
              ),
            );
        } else if (state is LoginDone) {
          BlocProvider.of<AuthenticationBloc>(context)..add(LoggedIn());
        }
      },
      child: BlocBuilder(
        bloc: BlocProvider.of<LoginBloc>(context),
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  style: Theme.of(context).textTheme.bodyText2,
                  validator: (val) {
                    return Validators.isValidEmail(val)
                        ? null
                        : "Email is Not Valid";
                  },
                  onFieldSubmitted: (val) {
                    print("Email: $val");
                    if (Validators.isValidEmail(val)) {
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    }
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(width: 1),
                      ),
                      labelText: "Email"),
                ),
                TextFormField(
                  focusNode: _passwordFocusNode,
                  controller: _passwordController,
                  style: Theme.of(context).textTheme.bodyText2,
                  validator: (val) {
                    return Validators.isValidPassword(val)
                        ? null
                        : "Password only contain letter and number";
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                ),
                RaisedButton(
                  shape: StadiumBorder(
                      side: BorderSide(
                    width: 1,
                  )),
                  onPressed: () {
                    //todo: add login event in login bloc
                    if (_formKey.currentState.validate()) {
                      BlocProvider.of<LoginBloc>(context)
                        ..add(
                          LoginWithCred(
                              email: _emailController.text,
                              password: _passwordController.text),
                        );
                    }
                  },
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "LOGIN",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(letterSpacing: 3),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
