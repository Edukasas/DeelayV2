import 'package:flutter/material.dart';
import 'package:myapp/config/constants/colors.dart';

class ScreenTimeInfo extends StatelessWidget {
  final String displayText;
  final Color color; // Correct type for color
  final String timeSpent;
  final IconData icon;

  const ScreenTimeInfo({
    super.key,
    required this.displayText,
    required this.color, // Color prop
    required this.timeSpent,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Deelay.neutral800,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 61,
            color: Deelay.neutral800,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Text(
                      displayText, // Using the passed displayText prop
                      style: const TextStyle(
                        fontSize: 16,
                        color: Deelay.neutral000,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 24, // Width based on percentage
                        height: 10,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF686B72), // Border color
                            width: 0.4, // Width of the border
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: color, // Using the passed color prop
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        timeSpent, // Using the passed timeSpent prop
                        style: const TextStyle(
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
