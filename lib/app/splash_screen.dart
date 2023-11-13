import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _loadNextScreen();
    super.initState();
  }

  Future<void> _loadNextScreen() async {
    await Future.delayed(Duration(seconds: 10));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userLogged = prefs.getString('email');

    if (userLogged == null) {
      Navigator.pushNamed(context, '/login');
    } else {
      Navigator.pushNamed(context, '/navigasi');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo2.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
