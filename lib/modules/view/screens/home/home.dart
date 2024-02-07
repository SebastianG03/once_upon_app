import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/shared/shared.dart';


class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: widget.navigationShell,
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: const NavbarFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(activeIndex: 0, navigationShell: widget.navigationShell), //TODO arreglar posicion
    );
  }
}