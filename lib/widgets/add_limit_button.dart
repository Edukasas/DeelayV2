import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/config/constants/colors.dart';


// || HOW TO USE,
// INPUTS: an onclick function
// OUTPUTS: on button click outputs the onclick function

class AddLimitButton extends StatelessWidget {
  final VoidCallback onPressed; // Function to handle button press.

  const AddLimitButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      width: 137.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Adjust the radius to make the button less round.
          ),
          backgroundColor: Deelay.primary,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              // ignore: deprecated_member_use
              child: SvgPicture.asset('assets/icons/icon.svg', color: Deelay.subtle),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: const Text(
                style: TextStyle(
                  fontSize: 14,
                  color: Deelay.subtle,
                ),
                'Add limit'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
