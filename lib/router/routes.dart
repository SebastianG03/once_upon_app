
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:once_upon_app/modules/view/screens/home/home.dart';
import 'package:once_upon_app/modules/view/screens/user/user.dart';
import 'package:once_upon_app/modules/view/views/home/home_views.dart';

import '../modules/view/views/home/user/sign/sign_in.dart';
import '../modules/view/views/home/user/sign/sign_up.dart';

class AppRoutes {
  AppRoutes();

  //Home Routes paths
  static const String _homeRoute = '/home';
  static const String _userRoute = '/user';

  //Routes names
  static const String principalView = 'home';
  static const String userView = 'user';

  //User Sub Routes paths
  static const String _signInRoute = 'sign_in';
  static const String _signUpRoutes = 'sign_up';

  //User Sub Routes names
  static const String signInView = 'sign_in';
  static const String signUpView = 'sign_up';
  static const String userConfigurationView = 'configuration';
  static const String userTalesView = 'tales';

  //Principal Sub Routes names

  //Navigator keys
  static final GlobalKey<NavigatorState> _rootKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _rootHome = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final GlobalKey<NavigatorState> _rootUser = GlobalKey<NavigatorState>(debugLabel: 'shellUser');

  static final GoRouter router = GoRouter(
    initialLocation: _homeRoute,
    navigatorKey: _rootKey,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
          //Main wrapper
          builder: (context, state, navigationShell) => HomeScreen(navigationShell: navigationShell),
          branches: <StatefulShellBranch>[
            //Branch home
            StatefulShellBranch(
              navigatorKey: _rootHome,
                routes: [
                  GoRoute(
                    path: _homeRoute,
                    name: principalView,
                    builder: (context, state) => PrincipalView(key: state.pageKey),
                    routes: [],
                  )
                ]
            ),

            //Branch user
            StatefulShellBranch(
                navigatorKey: _rootUser,
                routes: [
                  GoRoute(
                    path: _userRoute,
                    name: userView,
                    builder: (context, state) => UserView(key: state.pageKey),
                    routes: [
                      GoRoute(
                        path: _signInRoute,
                        name: signInView,
                        parentNavigatorKey: _rootKey,
                        builder: (context, state) => const User(widget: SignInView(), sign: true),
                        routes: [],
                      ),
                      GoRoute(
                        path: _signUpRoutes,
                        name: signUpView,
                        parentNavigatorKey: _rootKey,
                        builder: (context, state) => const User(widget: SignUpView(), sign: true),
                        routes: [],
                      ),
                      /*GoRoute(
                        path: 'configuration',
                        name: userConfigurationView,
                        builder: (context, state) => UserConfigurationView(key: state.pageKey),
                        routes: [],
                      ),
                      GoRoute(
                        path: 'tales',
                        name: userTalesView,
                        builder: (context, state) => UserTalesView(key: state.pageKey),
                        routes: [],
                      ),*/
                    ],
                  )
                ]
            )
          ]
      ),
    ],
  );
}