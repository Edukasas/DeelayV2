import 'package:flutter/material.dart';
import 'package:myapp/widgets/statistics_day_selector.dart';

class DayStatistics extends StatelessWidget {
  const DayStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Container(
            child: DaySelector(),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child:Text(
              textAlign: TextAlign.center,
              'CIA DAY'
            ),
          ),
        ],
      );
  }
}
