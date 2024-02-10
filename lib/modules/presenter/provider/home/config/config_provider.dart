import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:once_upon_app/modules/presenter/provider/home/app_provider.dart';

final _themeProvider = StateProvider<int>((ref) => 0);

final changeThemeProvider = Provider<int>((ref) {
  final prefs = ref.watch(preferencesProvider);
  prefs.setAppTheme(ref.state);
  ref.watch(_themeProvider.notifier).update((state) => ref.state);
  return ref.state;
});


final _notificationProvider = StateProvider<bool>((ref) => true);

final changeNotificationProvider = Provider<bool>((ref) {
  final prefs = ref.watch(preferencesProvider);
  prefs.setAllowNotifications(ref.state);
  ref.watch(_notificationProvider.notifier).update((state) => ref.state);
  return ref.state;
});