import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tiket_ceria/app/splash_screen.dart';
import 'package:tiket_ceria/pages/admin/daftar.dart';
import 'package:tiket_ceria/pages/admin/login.dart';
import 'package:tiket_ceria/pages/admin/lupa_sandi.dart';
import 'package:tiket_ceria/pages/home/navigasi.dart';
import 'package:tiket_ceria/pages/profil/edit_profil.dart';
import 'package:tiket_ceria/pages/profil/ganti_sandi.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCsHDQtI9DItQgSqwy45_y2xG9tDGxuER8",
        appId: "1:540215271818:web:8b22d4aee01acdce862873",
        messagingSenderId: "540215271818",
        projectId: "flutter-firebase-9c136",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiket Ceria',
      routes: {
        '/': (context) => SplashScreen(
              child: LoginPage(),
            ),
        '/login': (context) => LoginPage(),
        '/daftar': (context) => SignUpPage(),
        '/navigasi': (context) => NavigasiPage(),
        '/lupaSandi': (context) => LupaSandi(),
        '/editProfil': (context) => EditProfil(),
        '/gantiSandi': (context) => GantiSandi(),
      },
    );
  }
}
