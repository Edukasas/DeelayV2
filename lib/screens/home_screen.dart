import 'package:flutter/material.dart';
import 'package:myapp/widgets/add_limit_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to the Home Screen!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            AddLimitButton(
              onPressed: () {
                // Define the action on button click here.
                print('Button clicked!');
              },
            ),
          ],
        ),
      ),
    );
  }
}
