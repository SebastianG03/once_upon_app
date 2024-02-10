import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:once_upon_app/modules/entity/application/application_models.dart';
import 'package:once_upon_app/modules/interactor/configuration/preferences.dart';
import 'package:once_upon_app/modules/presenter/provider/home/user/sign/sign_provider.dart';
import 'package:once_upon_app/router/routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) => AppRoutes.router);
final preferencesProvider = Provider<Preferences>((ref) => Preferences());
final loadUserIdProvider = FutureProvider.family<UserModel?, String>((ref, id) {
  final datasource = ref.watch(userRepositoryProvider);
  return datasource.getById(id);
});