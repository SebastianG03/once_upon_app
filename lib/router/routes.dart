
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:once_upon_app/modules/view/screens/home/home.dart';
import 'package:once_upon_app/modules/view/views/home/home_views.dart';

class Routes {
  Routes();

  //Routes
  static const String _homeRoute = '/home';
  static const String _userRoute = '/user';

  //Routes names
  static const String principalView = 'home';
  static const String userView = 'user';

  //Navigator keys
  static final GlobalKey<NavigatorState> _rootKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _rootHome = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final GlobalKey<NavigatorState> _rootSearch = GlobalKey<NavigatorState>(debugLabel: 'shellSearch');
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
                  )
                ]
            )
          ]
      ),
    ],
  );
}