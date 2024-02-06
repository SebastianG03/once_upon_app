import 'package:flutter/material.dart';
import 'package:once_upon_app/modules/view/views/home/user/sign_in_views/user_view.dart';
import 'package:once_upon_app/modules/view/views/home/user/sign_out_views/user_view.dart';


class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return const UserSignOutView();
  }
}