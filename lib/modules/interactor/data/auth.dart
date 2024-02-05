import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:once_upon_app/modules/entity/application/application_models.dart';
import 'package:once_upon_app/modules/interactor/data/service.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Service _service = Service();

  //Sign in methods
  Future<UserModel?> signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      UserModel? user = UserModel.guest(id: result.user!.uid);
      return user;
    } catch (e) {
      if (kDebugMode) print("Error signing in anonymously: $e");
      return null;
    }
  }

  Future<UserModel?> googleSignIn() async {
    try {
      AuthProvider provider = GoogleAuthProvider();
      UserCredential result = await _auth.signInWithProvider(provider);
      UserModel? user = UserModel.provider(id: result.user!.uid, email: result.user!.email,
          username: result.user!.displayName, password: "");
      return user;
    } catch (e) {
      if (kDebugMode) print("Error signing in with Google: $e");
      return null;
    }
  }

  //Register and sign out methods

  Future createUser(UserModel user) async {
    await _service.createUser(user);
  }


  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      if (kDebugMode) print("Error signing out: $e");
      return null;
    }
  }
}