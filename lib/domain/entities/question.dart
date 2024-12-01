import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  String id;
  String text;
  String categoryId;
  String? authorId;

  Question({
    required this.id,
    required this.text,
    required this.categoryId,
    this.authorId
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        text: json["question_text"],
        categoryId: json["category_id"],
        authorId: json["author_id"]
      );

  factory Question.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) => Question(
        id: snapshot.id,
        text: snapshot.data()["question_text"],
        authorId: snapshot.data()["author_id"],
        categoryId: snapshot.data()["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question_text": text,
        "author_id" : authorId,
        "category_id" : categoryId
      };
}
