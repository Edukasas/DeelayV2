import 'package:flutter/material.dart';

class ScreenTimeInfo extends StatefulWidget {
  const ScreenTimeInfo({super.key});

  @override
  _ScreenTimeInfoState createState() => _ScreenTimeInfoState();
}

class _ScreenTimeInfoState extends State<ScreenTimeInfo> {
  String displayText = 'Hello, Flutter!';
  double percentage = 0.6;
  double barWidth = 120;
  String timeSpent = '3h 15m';

  @override
  Widget build(BuildContext context) {
    double currentBarWidth = percentage * barWidth;
    return Container(
      padding: const EdgeInsets.all(16), // Padding inside the container
      decoration: BoxDecoration(
        color: Colors.grey[850], // Background color
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Space between elements
        children: [
          // Icon Element
          const Icon(
            Icons.access_time, // Replace with your desired icon
            color: Colors.white,
            size: 24,
          ),
          // Text Element
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                displayText,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color
                ),
              ),
            ),
          ),
          // Line with Percentage
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  // Background line
                  Container(
                    width: barWidth, // Total width of the line
                    height: 10, // Height of the line
                    color: const Color.fromARGB(
                        255, 176, 186, 255), // Background color of the line
                  ),
                  // Filled portion starting from the right
                  Container(
                    width: currentBarWidth, // Width based on percentage
                    height: 10,
                    color: Colors.blue, // Color of the filled portion
                  ),
                ],
              ),
              Text(
                timeSpent,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
