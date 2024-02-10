import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../presenter/provider/providers.dart';
import 'guest_views/user_view.dart';
import 'logged_views/user_view.dart';


class UserView extends ConsumerWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    String id = "";
    ref.watch(preferencesProvider)
        .getUserId()
        .then((value) => (value.isNotEmpty) ? id = value : id = "");
    return const UserSignOutView();
/*
    return ( id.isNotEmpty )
        ? const UserSignOutView()
        : UserSignInView(userId: id,);*/
  }

}