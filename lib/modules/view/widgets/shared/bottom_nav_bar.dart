import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:go_router/go_router.dart';


class BottomNavBar extends StatefulWidget {
  int activeIndex;
  final StatefulNavigationShell navigationShell;
  BottomNavBar({super.key, this.activeIndex = 0, required this.navigationShell});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  final List<IconData> _icons = [
    Icons.home, //Principal page
    Icons.person, //User options
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      onTap: onTap,
      itemCount: _icons.length,
      activeIndex: widget.activeIndex,
      tabBuilder: (int index, bool isActive) {
        final color = isActive ? Colors.white : Colors.white54;
        return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _icons[index],
                color: color,
              ),
              const SizedBox(height: 4),
            ]
        );
      },
      backgroundColor: Colors.black87,
      splashColor: Colors.transparent,
      gapLocation: GapLocation.center,

      leftCornerRadius: 32,
      rightCornerRadius: 32,
    );
  }


  void onTap(int index) {
    //Update index
    setState(() {
      widget.activeIndex = index;
      if (kDebugMode) {
        print("Active index: ${widget.activeIndex} | Index Selected: ${index}");
      }
    });

    //Navigation
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}