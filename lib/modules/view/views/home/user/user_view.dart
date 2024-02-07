import 'package:flutter/material.dart';
import 'package:once_upon_app/modules/interactor/configuration/preferences.dart';

import 'guest_views/user_view.dart';
import 'logged_views/user_view.dart';


class UserView extends StatelessWidget {
  UserView({super.key});

  late String _userId = "";

  @override
  Widget build(BuildContext context) {
    getUserId();
    return (_userId != "")
        ? const UserSignOutView()
        : UserSignInView(userId: _userId,);
  }

  Future getUserId() async {
    _userId = await Preferences().getUserId();
  }
}