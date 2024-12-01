import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  String id;
  String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  factory Category.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) => Category(
        id: snapshot.id,
        name: snapshot.data()["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
