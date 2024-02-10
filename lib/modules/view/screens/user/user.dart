import 'package:flutter/material.dart';

import '../../widgets/components/home/app_bar.dart';

class User extends StatelessWidget {
  final Widget widget;
  const User({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return _UserSign(widget: widget);
  }
}

class _UserSign extends StatelessWidget {
  final Widget widget;
  const _UserSign({required this.widget});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: CustomAppBar(leading: true),
        ),
        resizeToAvoidBottomInset: false,

        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              widget,
            ],
          ),
        ),
      ),
    );
  }
}


