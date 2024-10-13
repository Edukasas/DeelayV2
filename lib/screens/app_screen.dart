import 'package:flutter/material.dart';
import 'package:myapp/widgets/add_limit_button.dart';
import 'package:myapp/widgets/empty_app_limits.dart';
import 'package:myapp/config/constants/colors.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Deelay.neutral900,
    body: Container(
      width: double.infinity,
      color: Deelay.neutral900,
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EmptyAppLimits(),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AddLimitButton(
                  onPressed: () {
                    print('Button clicked!');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

}
