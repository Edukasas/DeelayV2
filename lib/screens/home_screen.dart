import 'package:flutter/material.dart';
import 'package:myapp/widgets/categories_durationlimitselection.dart';
import 'package:myapp/config/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Deelay.neutral900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TimeLimitWidget(),
          //  Container(
            // child: TimeLimitWidget(),
          //  )
          ],
        ),
      ),
    );
  }
}
