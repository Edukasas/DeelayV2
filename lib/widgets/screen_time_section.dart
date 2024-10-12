import 'package:flutter/material.dart';
import 'package:myapp/config/constants/colors.dart';
import 'package:myapp/widgets/screen_time_circle.dart';
import 'package:myapp/widgets/screen_time_info.dart';

class ScreenTimeSection extends StatefulWidget {
  const ScreenTimeSection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScreenTimeSectionState createState() => _ScreenTimeSectionState();
}

class _ScreenTimeSectionState extends State<ScreenTimeSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Deelay.neutral800, // Background color
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: const Column(
        // Main column
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align items to the start
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            // Nested column with two elements
            children: [
              Text(
                'Screen Time',
                style: TextStyle(
                  color: Deelay.neutral000,
                  fontSize: 20,
                ),
              ),
              Text(
                '3h 15m', // Display time here
                style: TextStyle(
                  color: Deelay.neutral000,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          ScreenTimeCircle(),
          SizedBox(height: 8), // Space between additional texts
          SizedBox(
            height: 100, // Adjust height as needed
            child: ScreenTimeInfo(),
          ),
        ],
      ),
    );
  }
}

          // Text(
          //   'hi',
          //   style: TextStyle(
          //     color: Deelay.neutral000,
          //     fontSize: 20,
          //   ),
          // ),
          // Text(
          //   'hi 2',
          //   style: TextStyle(
          //     color: Deelay.neutral000,
          //     fontSize: 20,
          //   ),
          // )
