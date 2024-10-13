import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:myapp/config/constants/colors.dart';

class TimeLimitSelector extends StatefulWidget {
  const TimeLimitSelector({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TimeLimitSelector createState() => _TimeLimitSelector();
}

class _TimeLimitSelector extends State<TimeLimitSelector> {
  DateTime _selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10.0),
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              'Enter usage time',
              style: TextStyle(color: Deelay.neutral100, fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimePickerSpinner(
                is24HourMode: true, // 24-hour format for hours
                normalTextStyle: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(132, 202, 196, 208), // Default color for unselected text
                ),
                highlightedTextStyle: TextStyle(
                  fontSize: 24,
                  color: Deelay.pink,
                  fontWeight: FontWeight.w500 // Highlight color for selected text
                ),
                spacing: 20,
                itemHeight: 30,
                itemWidth: 30,
                alignment: Alignment.center,
                isForce2Digits: true, // Forces two digits for the hour display
                minutesInterval: 5,  // Skips minutes by setting the interval to 60 (effectively hiding them)
                onTimeChange: (time) {
                  setState(() {
                    _selectedTime = time; // Store the selected hour in _selectedTime
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Hour',
                  style: TextStyle(color: Deelay.neutral100, fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                  'Minute',
                  style: TextStyle(color: Deelay.neutral100, fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TimeLimitSelectorSecond extends StatefulWidget {
  const TimeLimitSelectorSecond({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TimeLimitSelectorSecond createState() => _TimeLimitSelectorSecond();
}

class _TimeLimitSelectorSecond extends State<TimeLimitSelectorSecond> {
  DateTime _selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10.0),
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              'Enter block time',
              style: TextStyle(color: Deelay.neutral100, fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimePickerSpinner(
                is24HourMode: true, // 24-hour format for hours
                normalTextStyle: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(132, 202, 196, 208), // Default color for unselected text
                ),
                highlightedTextStyle: TextStyle(
                  fontSize: 24,
                  color: Deelay.pink,
                  fontWeight: FontWeight.w500 // Highlight color for selected text
                ),
                spacing: 20,
                itemHeight: 30,
                itemWidth: 30,
                alignment: Alignment.center,
                isForce2Digits: true, // Forces two digits for the hour display
                minutesInterval: 5,  // Skips minutes by setting the interval to 60 (effectively hiding them)
                onTimeChange: (time) {
                  setState(() {
                    _selectedTime = time; // Store the selected hour in _selectedTime
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Hour',
                  style: TextStyle(color: Deelay.neutral100, fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                  'Minute',
                  style: TextStyle(color: Deelay.neutral100, fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
