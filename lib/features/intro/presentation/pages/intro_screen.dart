import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intro Screen'),
      ),
      body: const Center(
        child: Text('Welcome to the Intro Screen!'),
      ),
    );
  }
}
