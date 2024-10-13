import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting dates
import 'package:myapp/config/constants/colors.dart';

class WeekSelector extends StatefulWidget {
  const WeekSelector({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WeekSelectorState createState() => _WeekSelectorState();
}

class _WeekSelectorState extends State<WeekSelector> {
  DateTime _selectedDate = DateTime.now();  // Initialize with current date

  void _selectPreviousWeek() {
    setState(() {
      _selectedDate = _selectedDate.subtract(Duration(days: 7));  // Subtract one week
    });
  }

  void _selectNextWeek() {
    setState(() {
      _selectedDate = _selectedDate.add(Duration(days: 7));  // Add one week
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the start and end dates of the current week
    DateTime startOfWeek = _selectedDate.subtract(Duration(days: _selectedDate.weekday - 1));
    DateTime endOfWeek = startOfWeek.add(Duration(days: 6));

    return Container(
      color: Deelay.neutral900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_left, color: Deelay.neutral100),
            onPressed: _selectPreviousWeek,  // Go to previous week
          ),
          Text(
            '${DateFormat('MMM dd').format(startOfWeek)} - ${DateFormat('MMM dd').format(endOfWeek)}',
            style: TextStyle(fontSize: 18.0, color: Deelay.neutral100),
          ),
          Container(
            child:  (endOfWeek.add(Duration(days: 1))).isAfter(DateTime.now()) ? IconButton(
              icon: Icon(Icons.arrow_right, color: Deelay.neutral900,),
              onPressed: null,  // Dont go to next week
            )
            :
            IconButton(
              icon: Icon(Icons.arrow_right, color: Deelay.neutral100),
              onPressed: _selectNextWeek,  // Go to next week
            ),
          ),
        ],
      ),
    );
  }
}
