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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Screen Time',
                style: TextStyle(
                  color: Deelay.neutral000,
                  fontSize: 20,
                ),
              ),
              Text(
                '3h 15m',
                style: TextStyle(
                  color: Deelay.neutral000,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          ScreenTimeCircle(),
          SizedBox(height: 8),
          Column(
            children: [
              ScreenTimeInfo(
                displayText: 'Work',
                color: Deelay.chart050,
                timeSpent: '1h 22m',
                icon: Icons.work,
              ),
              SizedBox(height: 8),
              ScreenTimeInfo(
                displayText: 'Social',
                color: Deelay.chart100,
                timeSpent: '1h 47m',
                icon: Icons.social_distance_sharp,
              ),
              SizedBox(height: 8),
              ScreenTimeInfo(
                displayText: 'Video',
                color: Deelay.chart150,
                timeSpent: '2h 13m',
                icon: Icons.video_file,
              ),
              ScreenTimeInfo(
                displayText: 'Bank',
                color: Deelay.chart200,
                timeSpent: '53m',
                icon: Icons.money,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
