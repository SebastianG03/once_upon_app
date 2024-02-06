import 'package:flutter/material.dart';

import '../../widgets/components/home/app_bar.dart';

class User extends StatelessWidget {
  final Widget widget;
  final bool sign;
  const User({super.key, required this.widget, this.sign = false});

  @override
  Widget build(BuildContext context) {
    return (sign) ? _UserSign(widget: widget) : _UserActions(widget: widget);
  }
}

class _UserSign extends StatelessWidget {
  final Widget widget;
  const _UserSign({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: CustomAppBar(leading: true),
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: widget
            ),
          ],
        ),
      ),
    );
  }
}

class _UserActions extends StatelessWidget {
  final Widget widget;
  const _UserActions({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            CustomAppBar(leading: true),
            SingleChildScrollView(
                scrollDirection: Axis.vertical,
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: widget,
            ),
          ],
        ),
      ),
    );
  }
}


