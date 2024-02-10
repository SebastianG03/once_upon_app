import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:once_upon_app/router/routes.dart';
import 'package:once_upon_app/utility/app_theme.dart';

import 'firebase_options.dart';
import 'modules/presenter/provider/home/app_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(<DeviceOrientation> [
    DeviceOrientation.portraitUp,
  ]);

  await dotenv.load();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      const ProviderScope(
          child: MyApp()
      )
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final routes = ref.watch(appRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'OnceUponApp',
      routerConfig: routes,
      theme: AppTheme.lightTheme,
    );
  }
}
