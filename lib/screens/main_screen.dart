import 'package:flutter/material.dart';
import 'package:temple_on_wheel/components/custom_navbar.dart';
import 'package:temple_on_wheel/screens/Account/account_screen.dart';
import 'package:temple_on_wheel/screens/e_station_screen.dart';
import 'package:temple_on_wheel/screens/history_screen.dart';
import 'package:temple_on_wheel/screens/home_screen.dart';
import 'package:temple_on_wheel/screens/reservation_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    ReservationScreen(),
    StationScreen(),
    HistoryScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
