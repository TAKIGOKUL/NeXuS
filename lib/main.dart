import 'package:flutter/material.dart';
import 'package:nexus/pages/feed_section.dart';
import 'package:nexus/pages/login_page.dart'; // Import the feed section page

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          const LoginPage(), // Goku san to see feed section set FeedSection(),
    );
  }
}
