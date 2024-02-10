import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:once_upon_app/modules/interactor/configuration/preferences.dart';
import 'package:once_upon_app/modules/presenter/provider/home/app_provider.dart';
import 'package:once_upon_app/modules/view/widgets/components/home/app_bar.dart';

class PrincipalView extends ConsumerWidget {
  const PrincipalView({super.key});


  @override
  Widget build(BuildContext context, ref) {

    final prefs = ref.watch(preferencesProvider);
    String id = "";
    prefs.getUserId().then((value) => (value.isNotEmpty) ? id = value : id = "");

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

}
