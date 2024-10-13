import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:myapp/config/constants/colors.dart';

class TimeLimitSelectorDuration extends StatefulWidget {
  const TimeLimitSelectorDuration({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TimeLimitSelectorDuration createState() => _TimeLimitSelectorDuration();
}

class _TimeLimitSelectorDuration extends State<TimeLimitSelectorDuration> {
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
                is24HourMode: true,
                normalTextStyle: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(132, 202, 196, 208),
                ),
                highlightedTextStyle: TextStyle(
                  fontSize: 24,
                  color: Deelay.pink,
                  fontWeight: FontWeight.w500,
                ),
                spacing: 20,
                itemHeight: 30,
                itemWidth: 30,
                alignment: Alignment.center,
                isForce2Digits: true,
                minutesInterval: 5,
                onTimeChange: (time) {
                  setState(() {
                    _selectedTime = time;
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

class TimeLimitSelectorBlock extends StatefulWidget {
  const TimeLimitSelectorBlock({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TimeLimitSelectorBlock createState() => _TimeLimitSelectorBlock();
}

class _TimeLimitSelectorBlock extends State<TimeLimitSelectorBlock> {
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
                is24HourMode: true,
                normalTextStyle: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(132, 202, 196, 208),
                ),
                highlightedTextStyle: TextStyle(
                  fontSize: 24,
                  color: Deelay.pink,
                  fontWeight: FontWeight.w500
                ),
                spacing: 20,
                itemHeight: 30,
                itemWidth: 30,
                alignment: Alignment.center,
                isForce2Digits: true,
                minutesInterval: 5,
                onTimeChange: (time) {
                  setState(() {
                    _selectedTime = time;
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
