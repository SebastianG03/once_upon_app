import 'package:flutter/material.dart';
import 'package:once_upon_app/modules/view/widgets/screen_components/home/app_bar.dart';

class PrincipalView extends StatelessWidget {
  const PrincipalView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          Text("Principal View"),
        ],
      ),
    );
  }
}
