import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // Web configuration
    return const FirebaseOptions(
      apiKey: "AIzaSyAmY2o4l9reocN_mEsFQIMjwhWfxRnc3BI",
      authDomain: "temple-on-wheel.firebaseapp.com",
      projectId: "temple-on-wheel",
      storageBucket: "temple-on-wheel.firebasestorage.app",
      messagingSenderId: "144028459694",
      appId: "1:144028459694:web:228d6db36cf67eea33c33f",
    );
  }
}