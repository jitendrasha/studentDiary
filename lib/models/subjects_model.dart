// To parse this JSON data, do
//
//     final subjectsModel = subjectsModelFromJson(jsonString);

import 'dart:convert';

SubjectsModel subjectsModelFromJson(String str) =>
    SubjectsModel.fromJson(json.decode(str));

String subjectsModelToJson(SubjectsModel data) => json.encode(data.toJson());

class SubjectsModel {
  final String userId;
  final List<Subject> subjects;

  SubjectsModel({
    this.userId,
    this.subjects,
  });

  factory SubjectsModel.fromJson(Map<String, dynamic> json) => SubjectsModel(
        userId: json["userId"],
        subjects: List<Subject>.from(
            json["subjects"].map((x) => Subject.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "subjects": List<dynamic>.from(subjects.map((x) => x.toJson())),
      };
}

class Subject {
  final int attendence;
  final String image;
  final String subName;
  final String sallybusPdf;
  final List<Book> books;
  final Map teacherDetails;

  Subject(
      {this.attendence,
      this.image,
      this.subName,
      this.sallybusPdf,
      this.books,
      this.teacherDetails});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      attendence: json["attendence"],
      image: json["image"],
      subName: json["subName"],
      sallybusPdf: json["sallybusPdf"],
      books: json["books"] != null
          ? List<Book>.from(json["books"].map((x) => Book.fromJson(x)))
          : null,
      teacherDetails: json['teacherDetails'],
    );
  }

  Map<String, dynamic> toJson() => {
        "attendence": attendence,
        "image": image,
        "name": subName,
        "sallybusPdf": sallybusPdf,
        "books": List<dynamic>.from(books.map((x) => x.toJson())),
      };
}

class Book {
  final String name;
  final String image;

  Book({
    this.name,
    this.image,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}
