import 'package:flutter/material.dart';
import 'package:myapp/config/constants/colors.dart';
import 'package:myapp/widgets/screen_time_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Deelay.neutral900),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            ScreenTimeSection(), // Use the widget correctly here
          ],
        ),
      ),
    );
  }
}
