import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:once_upon_app/modules/entity/application/user.dart';
import 'package:once_upon_app/utility/encryption.dart';

class UserDatasource {
  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users');
  final Encryption _encrypt = Encryption();

  //User methods
  Future<bool> createUser(UserModel user) async {
    try {
      var snapshot = await _usersCollection
          .where('email', isEqualTo: user.email)
          .get();

      if(snapshot.docs.isNotEmpty) throw Exception('User with the same email already exists');

      user.password = _encrypt.encryptAES(user.password!);
      await _usersCollection.doc(user.id).set(user.toJson());
      return true;

    } catch (e) {
      if (kDebugMode) print("Error creating user: $e");
    }
    return false;
  }

  Future<UserModel?> getById(String id) async {
    try {
      var snapshot = await _usersCollection
          .where('id', isEqualTo: id)
          .get();
      if(snapshot.docs.isEmpty) throw Exception('User do not find');
      return UserModel.fromJson(snapshot.docs.first.data() as Map<String, dynamic>);
    } catch(e) {
      if (kDebugMode) print("Error getting user: $e");
      return null;
    }
  }

  Future<UserModel?> getUser(String email, String password) async {
    try {
      password = _encrypt.encryptAES(password);

      var snapshot = await _usersCollection
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();

      if(snapshot.docs.isEmpty) throw Exception('User does not exist or the credentials are incorrect');
      if(snapshot.docs.length > 1) throw Exception('More than one user with the same email and password');

      return UserModel.fromJson(snapshot.docs.first.data() as Map<String, dynamic>);

    } catch (e) {
      if (kDebugMode) print("Error getting user: $e");
      return null;
    }
  }

  Future<List<String>?> getUsernames() async {
    try {
      var snapshot = await _usersCollection.get();
      if(snapshot.docs.isNotEmpty) return snapshot.docs.map((e) => UserModel.fromJson(e.data() as Map<String, dynamic>).username!).toList();
      return null;
    } catch (e) {
      if (kDebugMode) print("Error getting usernames: $e");
      rethrow;
    }
  }

  Future<bool> updateUser(UserModel user) async {
    try {
      var snapshot = await _usersCollection
          .where('id', isEqualTo: user.id)
          .get();

      if(snapshot.docs.isEmpty) throw Exception('User with the same email does not exist');

      await _usersCollection.doc(user.id).update(user.toJson());
      return true;
    } catch (e) {
      if (kDebugMode) print("Error updating user: $e");
      return false;
    }
  }


}