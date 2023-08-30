import 'package:flutter/material.dart';
import 'package:flutter_chat/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

import '../components/custom_button.dart';
import '../components/text_field.dart';

class RegisterScreen extends StatefulWidget {
  final void Function()? onTap;
  const RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  void singUp() async {
    if (passwordTextController.text != confirmPasswordTextController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password do not match!')));
      return;
    }

    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.singUpWithEmailAndPassword(
          emailTextController.text, passwordTextController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.message,
                size: 100,
                color: Colors.grey[800],
              ),
              const SizedBox(height: 40),
              const Text(
                'Let`s create an account for you!',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: CustomTextField(
                  hintText: 'Confirm password',
                  obscureText: true,
                  textFieldController: confirmPasswordTextController,
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: singUp,
                text: 'Sing up',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already a member?'),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login now',
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
