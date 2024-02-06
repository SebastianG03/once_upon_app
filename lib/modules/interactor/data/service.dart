
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:once_upon_app/modules/entity/application/application_models.dart';
import 'package:once_upon_app/utility/encryption.dart';

class Service {
  //Collection reference
  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users');
  final CollectionReference _talesCollection = FirebaseFirestore.instance.collection('tales');
  final Encryption _encrypt = Encryption();

  Future createUser(UserModel user) async {
    try {
      var snapshot = await _usersCollection
          .where('email', isEqualTo: user.email)
          .get();

      if(snapshot.docs.isNotEmpty) throw Exception('User with the same email already exists');

      user.password = _encrypt.encryptAES(user.password!);

      return await _usersCollection.doc(user.id).set(user.toJson());


    } catch (e) {
      if (kDebugMode) print("Error creating user: $e");
      return null;
    }
  }

  Future postTale(Tale tale) async {
    try {
      var snapshot = await _talesCollection
          .where('author', isEqualTo: tale.author)
          .where('title', isEqualTo: tale.title)
          .get();
      if(snapshot.docs.isNotEmpty) throw Exception('User already posted this tale');

      return await _talesCollection.doc(tale.id).set(tale.toJson());

    } catch (e) {
      if (kDebugMode) print("Error posting tale: $e");
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

      if(snapshot.docs.isEmpty) return null;
      if(snapshot.docs.length > 1) throw Exception('More than one user with the same email and password');

      return UserModel.fromJson(snapshot.docs.first.data() as Map<String, dynamic>);

    } catch (e) {
      print("Error getting user: $e");
      return null;
    }
  }

  Future<List<Tale>> getTales() async {
    try {
      var snapshot = await _talesCollection.get();

      return snapshot.docs.map((e) => Tale.fromJson(e.data() as Map<String, dynamic>)).toList();

    } catch (e) {
      if (kDebugMode) print("Error getting tales: $e");
      return [];
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

  Future updateUser(UserModel user) async {
    try {
     var snapshot = await _usersCollection
          .where('id', isEqualTo: user.id)
          .get();

      if(snapshot.docs.isEmpty) throw Exception('User with the same email does not exist');

      return await _usersCollection.doc(user.id).update(user.toJson());
    } catch (e) {
      if (kDebugMode) print("Error updating user: $e");
      return null;
    }
  }

  Future deleteTale(Tale tale) async {
    try {
      var snapshot = await _talesCollection
          .where('id', isEqualTo: tale.id)
          .get();

      if(snapshot.docs.isEmpty) throw Exception('Tale does not exist');

      return await _talesCollection.doc(tale.id).delete();
    } catch (e) {
      if (kDebugMode) print("Error deleting tale: $e");
      return null;
    }
  }

}