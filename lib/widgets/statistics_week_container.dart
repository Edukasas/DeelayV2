import 'package:flutter/material.dart';
import 'package:myapp/widgets/statistics_week_selector.dart';

class WeekStatistics extends StatelessWidget {
  const WeekStatistics({super.key});

  @override
  Widget build(BuildContext context) {
   return
      Column(
        children: [
          Container(
            child: WeekSelector(),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child:Text(
              textAlign: TextAlign.center,
              'CIA WEEK'
            ),
          ),
        ],
      );
  }
}
