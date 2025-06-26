import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:temple_on_wheel/routers/router.dart';
import 'package:temple_on_wheel/services/firebase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  try{
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }catch(error){
    if(error.toString().contains('duplicate-app')){
      print('Firebase already initiliased');
    }else{
      print(error);
    }
  }

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
