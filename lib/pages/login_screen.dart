import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../components/text_field.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;
  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void singIp() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Icon(
                Icons.message,
                size: 100,
                color: Colors.grey[800],
              ),
              const SizedBox(height: 50),
              const Text(
                'Welcome back you`ve been missed!',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: CustomTextField(
                  hintText: 'Email',
                  obscureText: false,
                  textFieldController: emailTextController,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: CustomTextField(
                  hintText: 'Password',
                  obscureText: true,
                  textFieldController: passwordTextController,
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () {},
                text: 'Sing in',
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not a member?'),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register now',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
