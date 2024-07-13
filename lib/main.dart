import 'package:flutter/material.dart';
import 'package:nexus/pages/login_page.dart';
import 'package:nexus/pages/theme/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nexus',
      theme: lightMode,
      home: const LoginPage(),
    );
  }
}
