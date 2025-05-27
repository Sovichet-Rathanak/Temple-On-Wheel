import 'package:flutter/material.dart';
import 'package:temple_on_wheel/screens/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('Hello this is a home screen'),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DetailScreen()),
            );
          },
          child: Text('Go to Detail Screen'),
        ),
      ],
    );
  }
}
