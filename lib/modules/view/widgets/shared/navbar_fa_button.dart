import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NavbarFloatingActionButton extends StatelessWidget {
  const NavbarFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if (kDebugMode) {
          print("Upload story");
        }
      },
      shape: const CircleBorder(eccentricity: 1),
      backgroundColor: Colors.black,
      splashColor: Colors.transparent,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),

    );
  }
}