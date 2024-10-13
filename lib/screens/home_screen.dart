import 'package:flutter/material.dart';
import 'package:myapp/widgets/categories_durationlimitselection.dart';
// import 'package:myapp/widgets/app_block_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
