import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:temple_on_wheel/components/custom_navbar.dart';

class PrimaryLayout extends StatelessWidget {
  const PrimaryLayout({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CustomNavbar(
        selectedIndex: navigationShell.currentIndex,
        onItemTapped: navigationShell.goBranch,
      ),
    );
  }
}
