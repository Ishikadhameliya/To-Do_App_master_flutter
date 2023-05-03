import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_app/views/screens/home_page.dart';
import 'package:to_do_app/views/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'splash_screen',
          routes: {
            '/': (context) => const HomePage(),
            'splash_screen': (context) => const SplashScreen(),
          },
        );
      },
    );
  }
}
