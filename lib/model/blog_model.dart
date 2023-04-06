import 'package:cloud_firestore/cloud_firestore.dart';

class BlogModel {
  final String? id;
  final String? image;
  final String? description;
  final String? title;
  final String? category;
  final String? date;
  final String? author_id;
  final String? author_name;

  const BlogModel(
      {required this.id,
      required this.image,
      required this.description,
      required this.title,
      required this.category,
      required this.date,
      required this.author_id,
      required this.author_name});

  toJson() {
    return {
      "id": id,
      "image": image,
      "description": description,
      "title": title,
      "category": category,
      "date": date,
      "author_id": author_id,
      "author_name": author_name
    };
  }

  factory BlogModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return BlogModel(
        id: document.id,
        image: data["image"],
        description: data["description"],
        title: data["title"],
        category: data["category"],
        date: data["date"],
        author_id: data["author_id"],
        author_name: data["author_name"]);
  }
}
