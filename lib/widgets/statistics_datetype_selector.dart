import 'package:flutter/material.dart';
import 'package:myapp/config/constants/colors.dart';


// || HOW TO USE,
// INPUTS: an onclick function
// OUTPUTS: on button click outputs the onclick function

class DateTypeSelector extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const DateTypeSelector({super.key,required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 6.0),
      margin: EdgeInsets.symmetric(horizontal: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 6.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Deelay.neutral800),
                ),
                onPressed:(){onTap(0);},
                child: Text(
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: currentIndex == 0 ? Deelay.pink : Deelay.neutral000,
                    fontSize: 15
                  ),
                  'Day'
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 6.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Deelay.neutral800),
                ),
                onPressed:(){onTap(1);},
                child: Text(
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: currentIndex == 1 ? Deelay.pink : Deelay.neutral000,
                    fontSize: 15
                  ),
                  'Week'
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
