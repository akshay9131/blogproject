import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? username;
  final String? email;
  final String? password;

  const UserModel(
      {required this.id,
      required this.username,
      required this.email,
      required this.password});

  toJson() {
    return {
      "id": id,
      "UserName": username,
      "email": email,
      "password": password,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        username: data["username"],
        email: data["email"],
        password: data["password"]);
  }
}
