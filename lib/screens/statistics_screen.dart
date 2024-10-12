import 'package:flutter/material.dart';
import 'package:myapp/config/constants/colors.dart';
import 'package:myapp/widgets/AUDRIUI_DAY.dart';
import 'package:myapp/widgets/AUDRIUI_WEEK.dart';
import 'package:myapp/widgets/statistics_datetype_selector.dart';

class StatisticsScreen extends StatefulWidget{
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  int _currentIndex = 0;

  // SITI DU YRA WIDGETS KUR TU DESI SAVO STATISTIKA
  final List<Widget> _stats = [
    const DayStatistics(), // CONTAINERI SUKURT
    const WeekStatistics(), // CONTAINERI SUKURT
  ];

  void _onOptionTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Deelay.neutral900,
        toolbarHeight: 44.0,
        flexibleSpace: Center(
          child:DateTypeSelector(currentIndex: _currentIndex, onTap: _onOptionTapped),
          ),
      ),
      body: Center(
        child: _stats[_currentIndex],
      ),
    );
  }
}
