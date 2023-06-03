import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/resources/auth_methods.dart';
import 'package:flutter_zoom_clone/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Start or join a meeting',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 35),
              child: Image.asset('assets/images/onboarding.jpg')),
          CustomButton(
            text: 'Login',
            onPressed: () async {
              print('button called');
              bool res = await _authMethods.signInWithGoogle(context);
              if (res) {
                Navigator.pushNamed(context, '/home');
              }
            },
          )
        ],
      ),
    );
  }
}
