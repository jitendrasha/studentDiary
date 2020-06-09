import 'package:flutter/material.dart';
import 'package:flutterapp/models/user.dart';
import 'package:flutterapp/screens/class_schedule.dart';
import 'package:flutterapp/widgets/profile_card.dart';

class AccountScreen extends StatelessWidget {
  final UserModel user;

  const AccountScreen({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("PROFILE"),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: _height * 0.2,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(29),
                  bottomRight: Radius.circular(29),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ProfileCard(
                  isExpanded: true,
                  image: user.image,
                  title: user.name,
                  subtitle1: user.email,
                  subtitle2: user.rollNo,
                ),
                Card(
                  //middle card
                  elevation: 10,
                  shadowColor: Colors.grey[100],
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text(user.mobileNumber),
                        leading: Icon(Icons.phone),
                        dense: true,
                      ),
                      ListTile(
                        title: Text(user.email),
                        leading: Icon(Icons.email),
                        dense: true,
                      ),
                    ],
                  ),
                ),
                Card(
                  //middle card
                  elevation: 10, shadowColor: Colors.grey[100],

                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Mother Name: ",
                              style: kRowTextStyle,
                            ),
                            Text(
                              "${user.motherName}",
                              style: kRowTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Father Name: ",
                              style: kRowTextStyle,
                            ),
                            Text(
                              "${user.fatherName}",
                              style: kRowTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Address: ",
                              style: kRowTextStyle,
                            ),
                            Text(
                              "${user.homeAddress}",
                              style: kRowTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
