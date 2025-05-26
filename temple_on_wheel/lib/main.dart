import 'package:flutter/material.dart';
import 'package:temple_on_wheel/browse/browse.dart';

final List<String> motorbikes = [
  'assets/motorbike1.png',
  'assets/motorbike1.png',
  'assets/motorbike2.png',
  'assets/motorbike2.png',
  'assets/motorbike3.png',
  'assets/motorbike3.png',
  'assets/motorbike1.png',
];

final List<String> bikecycles = [
  'assets/bikecycle1.png',
  'assets/bikecycle2.png',
  'assets/bikecycle3.png',
  'assets/bikecycle4.png',
  'assets/bikecycle5.png',
  'assets/bikecycle6.png',
];

final List<String> electricbikes = [
  'assets/ebike1.png',
  'assets/ebike1.png',
  'assets/ebike1.png',
  'assets/ebike1.png',
];

void main() {
  runApp(const MyApp());
}

class BaseLayout extends StatelessWidget {
  final Widget child;
  const BaseLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Temple on Wheel',
          style: TextStyle(fontSize: 24, color: Color(0xffFCFCD4)),
        ),
        backgroundColor: Color(0xFF144434),
      ),
      body: child,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temple On Wheel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/motorbikes': (context) => Browse(data: motorbikes),
        '/bikecycles': (context) => Browse(data: bikecycles),
        '/electricbikes': (context) => Browse(data: electricbikes),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Browse(data: motorbikes),
                  ),
                );
              },
              child: const Text('Go to Motorbikes'),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Browse(data: bikecycles),
                  ),
                );
              },
              child: const Text('Go to Bikecycles'),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Browse(data: electricbikes),
                  ),
                );
              },
              child: const Text('Go to ElectricBike'),
            ),
          ],
        ),
      ),
    );
  }
}
