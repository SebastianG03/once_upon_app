import 'package:uuid/uuid.dart';

class UserModel {
  final String id;
  String? username;
  String? email;
  String? password;

  UserModel({
    required this.username,
    required this.email,
    required this.password
  }) : id = const Uuid().v4();

  UserModel.provider({
    required this.id,
    required this.username,
    required this.email,
    required this.password
  });

  UserModel.guest({
    this.id = "",
    this.username = "Guest",
    this.email = "",
    this.password = ""
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        email = json['email'],
        password = json['password'];


  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
    'password': password
  };


}