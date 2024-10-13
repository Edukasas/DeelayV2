import 'package:flutter/material.dart';
import 'package:myapp/widgets/categories_durationlimitselection.dart';
// import 'package:myapp/widgets/app_block_list.dart';

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
