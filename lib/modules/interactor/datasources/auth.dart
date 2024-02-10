import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:once_upon_app/modules/entity/application/application_models.dart';
import 'package:once_upon_app/modules/interactor/datasources/user_datasource.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserDatasource _service = UserDatasource();

  //Sign in methods
  Future<UserModel> signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      UserModel user = UserModel.guest(id: result.user!.uid);
      return user;
    } catch (e) {
      if (kDebugMode) print("Error signing in anonymously: $e");
      rethrow;
    }
  }

  Future<UserModel> googleSignIn() async {
    try {
      AuthProvider provider = GoogleAuthProvider();
      UserCredential result = await _auth.signInWithProvider(provider);
      UserModel? user = UserModel.provider(id: result.user!.uid, email: result.user!.email,
          username: result.user!.displayName, password: "");
      return user;
    } catch (e) {
      if (kDebugMode) print("Error signing in with Google: $e");
      rethrow;
    }
  }

  Future<UserModel> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserModel user = await _service.getUser(email, password);
      return user;
    } catch (e) {
      if (kDebugMode) print("Error signing in with email and password: $e");
      rethrow;
    }
  }

  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      if (kDebugMode) print("Error signing out: $e");
      return false;
    }
  }
}