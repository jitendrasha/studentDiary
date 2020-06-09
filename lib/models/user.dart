import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserModel {
  final String fatherName;
  final String mobileNumber;
  final String name;
  final String motherName;
  final String course;
  final String rollNo;
  final String userId;
  final String email;
  final String image;
  final String homeAddress;

  UserModel(
      {this.fatherName,
      this.mobileNumber,
      this.name,
      this.motherName,
      this.course,
      this.rollNo,
      this.userId,
      this.email,
      this.image,
      this.homeAddress});

  factory UserModel.fromJson(DocumentSnapshot doc) => UserModel(
      course: doc.data["course"],
      email: doc.data["email"],
      fatherName: doc.data["fatherName"],
      homeAddress: doc.data["homeAddress"],
      image: doc.data["image"],
      mobileNumber: doc.data["mobileNumber"],
      motherName: doc.data["motherName"],
      name: doc.data["name"],
      rollNo: doc.data["rollNo"],
      userId: doc.data["userId"]);

  @override
  String toString() {
    // TODO: implement toString
    return "UserModel (name: $name,email: $email)";
  }
}
