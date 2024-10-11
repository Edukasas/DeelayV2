import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Screen'),
      ),
      body: const Center(
        child: Text(
          'This is the App Screen!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
