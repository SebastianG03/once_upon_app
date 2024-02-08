import 'package:once_upon_app/modules/entity/application/user.dart';
import 'package:once_upon_app/modules/entity/repositories/user_repository.dart';
import 'package:once_upon_app/modules/interactor/datasources/auth.dart';
import 'package:once_upon_app/modules/interactor/datasources/user_datasource.dart';

class UserRepository extends UserRepositoryModel {

  final UserDatasource userDatasource;
  final Auth _auth = Auth();
  UserRepository(this.userDatasource);

  @override
  Future<bool> createUser(UserModel user) {
    return userDatasource.createUser(user);
  }

  @override
  Future<UserModel?> getById(String id) {
    return userDatasource.getById(id);
  }

  @override
  Future<UserModel?> googleSignIn() {
    return _auth.googleSignIn();
  }

  @override
  Future<UserModel?> signInAnonymously() {
    return _auth.signInAnonymously();
  }

  @override
  Future<UserModel?> signInWithEmailAndPassword(String email, String password) {
    return _auth.signInWithEmailAndPassword(email, password);
  }

  @override
  Future<bool> signOut() {
    return _auth.signOut();
  }

  @override
  Future<bool> updateUser(UserModel user) {
    return userDatasource.updateUser(user);
  }

  @override
  Future<List<String>?> getUsernames() {
    return userDatasource.getUsernames();
  }

}