import 'package:flutter/material.dart';
import 'package:myapp/widgets/add_limit_button.dart';
import 'package:myapp/widgets/empty_app_limits.dart';
import 'package:myapp/config/constants/colors.dart';
import 'package:myapp/widgets/category_creation.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Ensures the container takes full width
        color: Deelay.neutral900, // Your custom color
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centers vertically
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Centers horizontally
                children: [
                  EmptyAppLimits(), // This will be centered in the screen
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  bottom: 20, right: 20), // Adds space from bottom
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AddLimitButton(
                    onPressed: () {
                      // Navigate to the CategoryCreationPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CategoryCreationWidget(),
                        ),
                      );
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
