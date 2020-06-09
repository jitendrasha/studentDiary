import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: _height,
          width: _width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "STUDENT LOGIN",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      letterSpacing: 2,
                      wordSpacing: 2,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                height: _height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/14042.jpg"), fit: BoxFit.cover),
                ),
              ),
              Container(
                height: _height * 0.4,
                child: LoginForm(),
                padding: EdgeInsets.symmetric(horizontal: 19),
              )
            ],
          ),
        ),
      ),
    );
  }
}
