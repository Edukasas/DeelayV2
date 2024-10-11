import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text; // Button text.
  final VoidCallback onPressed; // Function to handle button press.

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ), // Action when button is pressed.
      child: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
