import 'package:flutter/material.dart';
import 'package:flutter_chat/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void singOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.singOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page'),
        actions: [
          IconButton(onPressed: singOut, icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
