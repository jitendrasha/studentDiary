import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/screens/sessional_schedule.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutterapp/bloc/authentication/authentication_bloc.dart';
import 'package:flutterapp/bloc/authentication/authentication_event.dart';
import 'package:flutterapp/bloc/result/bloc.dart';
import 'package:flutterapp/bloc/student/bloc.dart';
import 'package:flutterapp/models/user.dart';
import 'package:flutterapp/screens/class_schedule.dart';
import 'package:flutterapp/screens/result_screen.dart';
import 'package:flutterapp/screens/subject_page.dart';
import 'package:flutterapp/services/user_repository.dart';
import 'package:flutterapp/widgets/component.dart';
import 'package:flutterapp/widgets/profile_card.dart';

import 'account.dart';

class DashBoard extends StatelessWidget {
  final UserModel user;

  DashBoard({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SubjectBloc>(context);
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: Drawer(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            UserAccountsDrawerHeader(
                currentAccountPicture: GestureDetector(
                  onTap: () {
                    print("hello");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountScreen(
                                  user: user,
                                )));
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(user.image),
                  ),
                ),
                accountName: Text("${user.name}"),
                accountEmail: Text("${user.email}")),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClassSchedulePage(),
                  ),
                );
              },
              title: Text("TimeTable"),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                        create: (context) => ResultBloc(
                            RepositoryProvider.of<UserRepository>(context))
                          ..add(LoadResult()),
                        child: ResultScreen()),
                  ),
                );
              },
              title: Text("Result"),
            ),
            ListTile(
               onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SessionalSchedulePage(),
                  ),
                );
              },
              title: Text("Schedule"),
            ),
            ListTile(
              onTap: () {
                BlocProvider.of<AuthenticationBloc>(context)..add(LoggedOut());
              },
              title: Text("Log Out"),
            ),
          ],
        )),
        /*  appBar: AppBar(
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Text("DASHBOARD"),
        actions: <Widget>[
          IconButton(
              tooltip: "Logout",
              icon: Icon(
                Icons.exit_to_app,
              ),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context)..add(LoggedOut());
              })
        ],
      ),*/
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              stretch: true,
              pinned: true,
              primary: true,
              onStretchTrigger: () {
                // Function callback for stretch
                print("streched=============");
                return;
              },
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                centerTitle: true,
                title: Text(user.name),
                background: Image.network(
                  user.image,
                  fit: BoxFit.cover,
                ),
//                background: ProfileCard(
//                  image: user.image,
//                  title: user.name,
//                  isExpanded: false,
//                  subtitle1: user.course,
//                ),
              ),
            ),
            BlocBuilder(
              bloc: BlocProvider.of<SubjectBloc>(context),
              builder: (context, state) {
                if (state is SubjectsLoading) {
                  return SliverFillRemaining(
                    child: Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is SubjectsLoaded) {
                  return SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200.0,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 1,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Component(
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubjectPage(
                                            subject:
                                                state.model.subjects[index],
                                          )));
                            },
                            title: state.model.subjects[index].subName,
                            image: state.model.subjects[index].image,
                          );
                        },
                        childCount: state.model.subjects.length,
                      ),
                    ),
                  );
                } else if (state is SubjectsLoadingFail) {
                  return SliverFillRemaining(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(state.reason),
                    ),
                  );
                }
                return SliverFillRemaining(
                  child: Container(),
                );
              },
            ),
          ],
        ));
  }
}

//SliverFixedExtentList(
//              itemExtent: 50.0,
//              delegate: SliverChildBuilderDelegate(
//                (BuildContext context, int index) {
//                  return Container(
//                    alignment: Alignment.center,
//                    color: Colors.lightBlue[100 * (index % 9)],
//                    child: Text('List Item $index'),
//                  );
//                },
//              ),
//            ),
//return Scaffold(
//appBar: AppBar(
//elevation: 0,
//leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
//title: Text("DASHBOARD"),
//actions: <Widget>[
//IconButton(
//tooltip: "Logout",
//icon: Icon(
//Icons.exit_to_app,
//),
//onPressed: () {
//BlocProvider.of<AuthenticationBloc>(context)..add(LoggedOut());
//})
//],
//),
//body: Container(
//child: Stack(
//children: <Widget>[
//Container(
//height: _height * 0.2,
//decoration: BoxDecoration(
//color: Colors.blueAccent,
//borderRadius: BorderRadius.only(
//bottomLeft: Radius.circular(29),
//bottomRight: Radius.circular(29),
//)),
//),
//Column(
//mainAxisSize: MainAxisSize.max,
//mainAxisAlignment: MainAxisAlignment.spaceAround,
//children: <Widget>[
//ProfileCard(
//onPress: () {
//Navigator.push(
//context,
//MaterialPageRoute(
//builder: (context) => AccountScreen(
//user: user,
//)));
//},
//title: user.name,
//image: user.image,
//subtitle1: user.course,
//isExpanded: false,
//),
//GridView.builder(
//padding: EdgeInsets.only(left: 40, right: 40, top: 40),
//itemCount: 6,
//gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//crossAxisCount: 2,
//crossAxisSpacing: 10,
//mainAxisSpacing: 10,
//childAspectRatio: .9),
//itemBuilder: (context, index) => Component(
//height: _height * .1,
//width: _width * .3,
//image:
//"https://media.gettyimages.com/photos/stack-of-books-picture-id157482029?s=612x612",
//title: "Subject $index",
//)),
///* Container(
//                  height: 400,
//
//                   child: Column(
//                    children: <Widget>[
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Component(
//                            height: _height,
//                            width: _width,
//                            title: "OverAll",
//                            image:
//                                "https://media.gettyimages.com/photos/stack-of-books-picture-id157482029?s=612x612",
//                          ),
//                          Component(
//                            height: _height,
//                            width: _width,
//                            title: "Monthly",
//                            image:
//                                "https://media.gettyimages.com/photos/stack-of-books-picture-id157482029?s=612x612",
//                          ),
//                        ],
//                      ),
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Component(
//                            height: _height,
//                            width: _width,
//                            title: "Today",
//                            image:
//                                "https://media.gettyimages.com/photos/stack-of-books-picture-id157482029?s=612x612",
//                          ),
//                          Component(
//                            height: _height,
//                            width: _width,
//                            title: "Weekly",
//                            image:
//                                "https://media.gettyimages.com/photos/stack-of-books-picture-id157482029?s=612x612",
//                          ),
//                        ],
//                      ),
//                    ],
//                  ),
//                ),*/
//],
//)
//],
//),
//),
//);
