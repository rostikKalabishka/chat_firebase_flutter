import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/login_screen.dart';
import 'package:flutter_chat/pages/register_screen.dart';
import 'package:flutter_chat/services/auth/login_or_register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
    );
  }
}
