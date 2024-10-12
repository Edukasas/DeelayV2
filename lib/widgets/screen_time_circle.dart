import 'package:flutter/material.dart';
import 'package:myapp/config/constants/colors.dart';

class ScreenTimeCircle extends StatefulWidget {
  const ScreenTimeCircle({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScreenTimeCircle createState() => _ScreenTimeCircle();
}

class _ScreenTimeCircle extends State<ScreenTimeCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Deelay.neutral800, // Background color
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: const Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Space between children
        crossAxisAlignment:
            CrossAxisAlignment.center, // Align text to the start
        children: [
          Text(
            'Screen Circle',
            style: TextStyle(
              color: Deelay.neutral000,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 8), // Space between texts
          Text(
            '3h 15m', // Display time here
            style: TextStyle(
              color: Deelay.neutral000,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
