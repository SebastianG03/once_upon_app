import 'package:once_upon_app/modules/entity/application/application_models.dart';

abstract class UserRepositoryModel {
  Future<UserModel> signInAnonymously();
  Future<UserModel> googleSignIn();
  Future<UserModel> signInWithEmailAndPassword(String email, String password);
  Future<UserModel> getById(String id);
  Future<bool> createUser(UserModel user);
  Future<bool> updateUser(UserModel user);
  Future<List<String>> getUsernames();
  Future<bool> signOut();
}