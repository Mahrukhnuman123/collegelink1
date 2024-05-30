// lib/main.dart
import 'package:flutter/material.dart';
import 'package:profile_student/profile_screen.dart';
// Ensure the path is correct

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileScreen(),  // Ensure this matches the class name in profile_screen.dart
    );
  }
}