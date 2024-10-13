import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:myapp/config/constants/colors.dart';
import 'package:myapp/widgets/categories_textfield.dart';
import 'package:myapp/widgets/categories_timeselector.dart';


class TimeLimitWidget extends StatelessWidget {
const TimeLimitWidget({ super.key });

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Deelay.neutral700,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            child: TextFieldWithClearButton(),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 6.0),
            child: TimeLimitSelector(),
          ),
          Container(
            child: TimeLimitSelectorSecond(),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment:  MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Deelay.neutral700)),
                      onPressed:() {
                      print('Cancel button pressed');},
                      child: Text(
                      'Cancel',
                      style: TextStyle(color: Deelay.pink, fontWeight: FontWeight.w600),
                    ),
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Deelay.neutral700)),
                      onPressed:() {
                      print('Ok button pressed');},
                      child: Text(
                      'Ok',
                      style: TextStyle(color: Deelay.pink, fontWeight: FontWeight.w600),
                    ),
                    ),
              ],
            ),
          )
        ],
      ),
    );
  }
}