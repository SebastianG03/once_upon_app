import 'package:flutter/material.dart';
import 'package:once_upon_app/modules/interactor/configuration/preferences.dart';
import 'package:once_upon_app/modules/view/widgets/components/home/app_bar.dart';

class PrincipalView extends StatelessWidget {
  PrincipalView({super.key});

  late String _userId = "";

  @override
  Widget build(BuildContext context) {
    getUserId();
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          CustomAppBar(leading: false),
          Text("Principal View"),
        ],
      ),
    );
  }

  Future getUserId() async {
    _userId = await Preferences().getUserId();
  }
}
