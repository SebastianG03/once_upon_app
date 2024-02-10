import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:once_upon_app/modules/view/widgets/components/home/user_card.dart';

import '../../../../../entity/application/user.dart';
import '../../../../../presenter/provider/providers.dart';

class UserSignInView extends ConsumerWidget {
  final String userId;
  const UserSignInView({super.key, required this.userId});

  @override
  Widget build(BuildContext context, ref) {
    UserModel? user;
    final userProvider = ref.watch(userByIdProvider(userId));
    setUserModel(user!, userProvider);

    List<String> signInItems = ['Your tales', 'Configuration and Privacy', 'Sign Out'];
    List<IconData> signInIcons = [Icons.book, Icons.settings, Icons.exit_to_app];
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UserCard(user: user,),
            const SizedBox(height: 30,),
            ListView.builder(
              itemCount: signInItems.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, i) => ListTile(
                leading: Icon(signInIcons[i]),
                title: Text(signInItems[i], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                onTap: (){},
              ),

            )
          ],
        ),
      ),
    );
  }

  Future<void> setUserModel(UserModel user, Future<UserModel> userProvider, ) async {
    final resut = await userProvider;
    user = (resut == null)? UserModel.guest() : resut;
  }

}
