import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/config/constants/colors.dart';

class TextFieldWithClearButton extends StatefulWidget {
  const TextFieldWithClearButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TextFieldWithClearButtonState createState() => _TextFieldWithClearButtonState();
}

class _TextFieldWithClearButtonState extends State<TextFieldWithClearButton> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312.0,
       child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _controller,
            style: TextStyle(color: Deelay.neutral100),  // Text color
            decoration: InputDecoration(
              filled: true,
              fillColor: Deelay.neutral600,  // Dark background color
              hintText: 'Enter category name',
              hintStyle: TextStyle(color: Colors.grey[400]),  // Placeholder text style
              suffixIcon: _controller.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(Icons.clear, color: Colors.grey[400]),
                      onPressed: () {
                        _controller.clear();
                        setState(() {});  // To update the clear icon visibility
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),  // Rounded corners
                borderSide: BorderSide.none,  // Remove border
              ),
            ),
            onChanged: (text) {
              // Rebuild the widget to show/hide clear button
              setState(() {});
            },
            onSubmitted: (text) {
              // Handle submission when 'Enter' is pressed
              print('Submitted: $text');
            },
            textInputAction: TextInputAction.done,  // Enables 'Enter' key to submit
          ),
        ),
      ),
    );
  }
}