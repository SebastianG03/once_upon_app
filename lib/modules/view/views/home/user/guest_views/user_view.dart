
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:once_upon_app/modules/entity/application/user.dart';
import 'package:once_upon_app/modules/view/widgets/components/home/user_card.dart';
import 'package:once_upon_app/router/routes.dart';

import '../../../../../presenter/provider/providers.dart';

class UserSignOutView extends ConsumerWidget {
  const UserSignOutView({super.key});

  @override
  Widget build(BuildContext context, ref) {

    List<String> signOutItems = ['Sign In', 'Register'];
    List<IconData> signOutIcons = [Icons.output_rounded, Icons.person_add_rounded];
    List<Function> signFunctions = [signIn, signUp];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              UserCard(user: UserModel.guest(),),
              const SizedBox(height: 30,),
              ListView.builder(
                itemCount: signOutItems.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, i) => ListTile(
                  leading: Icon(signOutIcons[i]),
                  title: Text(signOutItems[i], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                  onTap: () => signFunctions[i](context)
                ),

              )
            ],
          ),
        ),
      ),
    );
  }

  void signIn(BuildContext context) => context.goNamed(AppRoutes.signInView);
  void signUp(BuildContext context) => context.goNamed(AppRoutes.signUpView);

}