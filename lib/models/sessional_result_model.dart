// To parse this JSON data, do
//
//     final sessionalResult = sessionalResultFromJson(jsonString);

class SessionalResult {
  final List<Sessional> sessionalFirst;
  final List<Sessional> sessionalSecond;
  final List<Sessional> sessionalThird;

  SessionalResult({
    this.sessionalFirst,
    this.sessionalSecond,
    this.sessionalThird,
  });

  SessionalResult copyWith({
    List<Sessional> sessionalFirst,
    List<Sessional> sessionalSecond,
    List<Sessional> sessionalThird,
  }) =>
      SessionalResult(
        sessionalFirst: sessionalFirst ?? this.sessionalFirst,
        sessionalSecond: sessionalSecond ?? this.sessionalSecond,
        sessionalThird: sessionalThird ?? this.sessionalThird,
      );

  factory SessionalResult.fromJson(Map<String, dynamic> json) =>
      SessionalResult(
        sessionalFirst: json["sessionalFirst"] == null
            ? null
            : List<Sessional>.from(
                json["sessionalFirst"].map((x) => Sessional.fromJson(x))),
        sessionalSecond: json["sessionalSecond"] == null
            ? null
            : List<Sessional>.from(
                json["sessionalSecond"].map((x) => Sessional.fromJson(x))),
        sessionalThird: json["sessionalThird"] == null
            ? null
            : List<Sessional>.from(
                json["sessionalThird"].map((x) => Sessional.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sessionalFirst": sessionalFirst == null
            ? null
            : List<dynamic>.from(sessionalFirst.map((x) => x.toJson())),
        "sessionalSecond": sessionalSecond == null
            ? null
            : List<dynamic>.from(sessionalSecond.map((x) => x.toJson())),
        "sessionalThird": sessionalThird == null
            ? null
            : List<dynamic>.from(sessionalThird.map((x) => x.toJson())),
      };
}

class Sessional {
  final String subjectName;
  final int totalMarks;
  final int obtainMarks;

  Sessional({
    this.subjectName,
    this.totalMarks,
    this.obtainMarks,
  });

  Sessional copyWith({
    String subjectName,
    int totalMarks,
    int obtainMarks,
  }) =>
      Sessional(
        subjectName: subjectName ?? this.subjectName,
        totalMarks: totalMarks ?? this.totalMarks,
        obtainMarks: obtainMarks ?? this.obtainMarks,
      );

  factory Sessional.fromJson(Map<String, dynamic> json) => Sessional(
        subjectName: json["subjectName"] == null ? null : json["subjectName"],
        totalMarks: json["totalMarks"] == null ? null : json["totalMarks"],
        obtainMarks: json["obtainMarks"] == null ? null : json["obtainMarks"],
      );

  Map<String, dynamic> toJson() => {
        "subjectName": subjectName == null ? null : subjectName,
        "totalMarks": totalMarks == null ? null : totalMarks,
        "obtainMarks": obtainMarks == null ? null : obtainMarks,
      };
}
