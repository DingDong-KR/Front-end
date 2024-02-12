import 'package:flutter/material.dart';

class ForgotIdScreen extends StatefulWidget {
  const ForgotIdScreen({super.key});

  @override
  State<ForgotIdScreen> createState() => _ForgotIdScreenState();
}

class _ForgotIdScreenState extends State<ForgotIdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: const Center(
        child: Text('This is the forgot password page.'),
      ),
    );
  }
}
