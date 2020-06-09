import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterapp/models/sessional_result_model.dart';
import 'package:flutterapp/models/subjects_model.dart';
import '../models/user.dart';
import 'package:flutter/services.dart';

// If FirebaseAuth and/or GoogleSignIn are not injected into the UserRepository, then we instantiate them internally.
// This allows us to be able to inject mock instances so that we can easily test the UserRepository

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  UserRepository({
    FirebaseAuth firebaseAuth,
    GoogleSignIn googleSignin,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn();
  String _userId;

  String get userId => this._userId;

  Future<FirebaseUser> signInWithCredentials(
      String email, String password) async {
    print("inside function");
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print("user id ==> ${result.user.uid}");
    _userId = result.user.uid;
    return result.user;
  }

  Future<String> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return 'success';
    } catch (e) {
      //(e.message);
      return e.message;
    }
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
//      _googleSignIn.signOut(),
    ]);
  }

  Future<UserModel> getCurrentUserDetail(String userId) async {
    var doc = await Firestore.instance
        .collection("user")
        .where("userId", isEqualTo: userId)
        .getDocuments()
        .then((value) => value.documents.first);
    return UserModel.fromJson(doc);
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<FirebaseUser> getCurrentUser() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser;
  }

  Future<String> getCurrentUserid() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser.uid;
  }

  Future<SubjectsModel> loadSubjects() async {
    try {
      final subjects = Firestore.instance.collection("subjects");
      var data = await subjects
          .where("userId", isEqualTo: await getCurrentUserid())
          .getDocuments();
//          .then((value) => value.documents.map((e) => print(e)));
//      print(data);
      final model =
          data.documents.map((e) => SubjectsModel.fromJson(e.data)).first;
      print(model);
      return model;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<File> createFileOfPdfUrl(String urlPdf) async {
    final filename = urlPdf.substring(urlPdf.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(urlPdf));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    print(file);
    return file;
//    return \;
  }

  Future<SessionalResult> loadResult() async {
    final subjects = Firestore.instance.collection("results");
    var data = await subjects
        .where("userId", isEqualTo: await getCurrentUserid())
        .getDocuments();
//          .then((value) => value.documents.map((e) => print(e)));
//      print(data);
    final model =
        data.documents.map((e) => SessionalResult.fromJson(e.data)).first;
    print(model);
    return model;
  }
}
