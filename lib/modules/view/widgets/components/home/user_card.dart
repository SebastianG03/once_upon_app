import 'package:flutter/material.dart';

import '../../../../entity/application/user.dart';

class UserCard extends StatelessWidget {
  final UserModel user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.5,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0 , horizontal: 15.0),
        child: Row(
          children: [
             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.greenAccent,
                  child: Text(user.username![0],),
                ),
              ],
            ),
            const SizedBox(width: 15,),
            Text('${user.username}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
            const Spacer(),
            const _UserColumns(title: 'Tales Posted', content: '0'),
          ],
        ),
      ),
    );
  }
}

class _UserColumns extends StatelessWidget {
  final String title;
  final String content;
  const _UserColumns({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(title, style: const TextStyle(fontSize: 17),),
        const SizedBox(height: 10,),
        Text(content, style: const TextStyle(fontSize: 15),),
      ],
    );
  }
}