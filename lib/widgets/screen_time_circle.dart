import 'package:flutter/material.dart';
import 'package:myapp/config/constants/colors.dart';

class ScreenTimeCircle extends StatefulWidget {
  const ScreenTimeCircle({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScreenTimeCircle createState() => _ScreenTimeCircle();
}

class _ScreenTimeCircle extends State<ScreenTimeCircle> {
  // Example array of screen time values
  final List<int> values = [10, 20, 12, 32];

  @override
  Widget build(BuildContext context) {
    // Calculate the total sum of values
    int total = values.reduce((a, b) => a + b);

    // Calculate the percentages for each value
    List<double> percentages = values.map((value) => value / total).toList();

    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Deelay.neutral800, // Background color
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: Column(
        children: [
          // Existing Row with the title and time display
          const Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Space between children
            crossAxisAlignment:
                CrossAxisAlignment.center, // Align text to the start
            children: [
              SizedBox(height: 12), // Space between texts
            ],
          ),
          SizedBox(
            height: 200,
            width: 200,
            child: CustomPaint(
              painter: DonutChartPainter(percentages, ColorsChart),
            ),
          ),
        ],
      ),
    );
  }
}

class DonutChartPainter extends CustomPainter {
  final List<double> percentages;
  final List<Color> colors;
  final double gap;

  DonutChartPainter(this.percentages, this.colors, {this.gap = 2});

  @override
  void paint(Canvas canvas, Size size) {
    double startAngle = -90; // Start from the top (12 o'clock position)
    final Paint paint = Paint()..style = PaintingStyle.fill;

    // Draw the donut sections
    for (int i = 0; i < percentages.length; i++) {
      final sweepAngle = percentages[i] * 360;

      // Calculate the effective sweep angle by subtracting the gap
      final effectiveSweepAngle = sweepAngle - gap;

      paint.color = colors[i % colors.length]; // Cycle through colors

      // Draw the outer arc (donut part)
      canvas.drawArc(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2,
        ),
        radians(startAngle), // Start angle in radians
        radians(effectiveSweepAngle), // Sweep angle in radians
        true,
        paint,
      );

      // Move the start angle forward by the effective sweep angle and the gap
      startAngle += effectiveSweepAngle + gap;
    }

    // Draw the inner circle (hole) to create a donut effect
    final Paint holePaint = Paint()
      ..color =
          Deelay.neutral800 // Color of the hole, should match the background
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2.28, // Radius of the hole, adjust as needed
      holePaint,
    );
  }

  double radians(double degrees) => degrees * (3.1415926535897932 / 180.0);

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint when the data changes
  }
}
