import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  void initState() {
    super.initState();

    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 250,
              width: 250,
              child: Image.asset("assets/images/todo_logo.png",),
            ),
          ],
        ),
      ),
    );
  }
}