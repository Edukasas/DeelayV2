import 'package:flutter/material.dart';
import 'package:myapp/config/constants/colors.dart';

class ScreenTimeInfo extends StatefulWidget {
  const ScreenTimeInfo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScreenTimeInfoState createState() => _ScreenTimeInfoState();
}

class _ScreenTimeInfoState extends State<ScreenTimeInfo> {
  String displayText = 'Work';
  double percentage = 0.6;
  double barWidth = 120;
  String timeSpent = '3h 15m';

  @override
  Widget build(BuildContext context) {
    double currentBarWidth = percentage * barWidth;

    return Container(
      decoration: BoxDecoration(
        color: Deelay.neutral800,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Container(
            height: 61,
            color: Deelay.neutral800,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.work,
                  color: Colors.white,
                  size: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Text(
                      displayText,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Deelay.neutral000,
                      ),
                    ),
                  ),
                ),
                // Aligning the Column here
                Align(
                  alignment: Alignment.centerRight, // Align to the right
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
                            width: barWidth, // Total width of the line
                            height: 10, // Height of the line
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF686B72), // Border color
                                width: 0.4, // Width of the border
                              ),
                              borderRadius: BorderRadius.circular(8),
                              color: Deelay.neutral700,
                            ),
                          ),
                          // Filled portion starting from the right
                          Container(
                            width: currentBarWidth, // Width based on percentage
                            height: 10,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF686B72), // Border color
                                width: 0.4, // Width of the border
                              ),
                              borderRadius: BorderRadius.circular(8),
                              color: Deelay.pink, // Color of the filled portion
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 4),
                      const Text(
                        '2h 15m',
                        style: TextStyle(
                          fontSize: 16,
                          color: Deelay.neutral000,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
