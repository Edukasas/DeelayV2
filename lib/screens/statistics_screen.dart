import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics Screen'),
      ),
      body: const Center(
        child: Text(
          'This is the Statistics Screen!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
