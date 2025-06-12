import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:temple_on_wheel/routers/router.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(const TempleApp());
}

class TempleApp extends StatelessWidget {
  const TempleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}