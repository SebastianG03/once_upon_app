import 'package:once_upon_app/modules/entity/application/application_models.dart';
import 'package:once_upon_app/modules/interactor/datasources/user_datasource.dart';
import 'package:once_upon_app/modules/interactor/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) => UserRepository(UserDatasource()));

final userByIdProvider = Provider.family<Future<UserModel>, String>((ref, id) async {
  final source = ref.watch(userRepositoryProvider);
  return await source.getById(id);
});

final generateUserProvider = Provider.family<void, Map<String, dynamic>>((ref, data) {
  final source = ref.watch(userRepositoryProvider);
  UserModel user = UserModel(
      email: data['email'],
      username: data['username'],
      password: data['password']
  );
  source.createUser(user);
});