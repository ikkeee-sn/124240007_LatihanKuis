import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const MyLibraryApp());
}

class MyLibraryApp extends StatelessWidget {
  const MyLibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Library',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}