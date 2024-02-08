import 'package:once_upon_app/modules/entity/application/application_models.dart';
import 'package:once_upon_app/modules/interactor/datasources/user_datasource.dart';
import 'package:once_upon_app/modules/interactor/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
/*
@riverpod
Future<UserModel?> loginProvider(String email, String password) {
  final datasource = UserRepository(UserDatasource());
  return datasource.signInWithEmailAndPassword(email, password);
}*/

final signProvider = Provider<UserRepository>((ref) => UserRepository(UserDatasource()));

