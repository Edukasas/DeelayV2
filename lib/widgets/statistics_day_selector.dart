import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting dates
import 'package:myapp/config/constants/colors.dart';

class DaySelector extends StatefulWidget {
  const DaySelector({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DaySelectorState createState() => _DaySelectorState();
}

class _DaySelectorState extends State<DaySelector> {
  DateTime _selectedDate = DateTime.now();  // Initialize with current date

  void _selectPreviousDay() {
    setState(() {
      _selectedDate = _selectedDate.subtract(Duration(days: 1));  // Subtract one day
    });
  }

  void _selectNextDay() {
    setState(() {
      _selectedDate = _selectedDate.add(Duration(days: 1));  // Add one day
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Deelay.neutral900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_left,  color: Deelay.neutral100),
            onPressed: _selectPreviousDay,  // Go to previous day
          ),
          Text(
            DateFormat('MMMM dd').format(_selectedDate),  // Format date as "Month Day"
            style: TextStyle(fontSize: 18.0,  color: Deelay.neutral100),
          ),
          Container(
            child:  (_selectedDate.add(Duration(days: 1))).isAfter(DateTime.now()) ? IconButton(
              icon: Icon(Icons.arrow_right, color: Deelay.neutral900,),
              onPressed: null,  // Dont go to next week
            )
            :
            IconButton(
              icon: Icon(Icons.arrow_right, color: Deelay.neutral100),
              onPressed: _selectNextDay,  // Go to next week
            ),
          ),
        ],
      ),
    );
  }
}