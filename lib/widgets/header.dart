import 'package:flutter/material.dart';
import 'package:myapp/config/constants/colors.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const Header({super.key, this.height = 64});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true, // Ensures the title is centered
      backgroundColor: Deelay.neutral900,
      toolbarHeight: height,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: const BoxConstraints(
              maxHeight: 64, // Set maximum height for the logo
            ),
            child: Image.asset(
              'assets/images/logo.png', // Path to your logo image
              height: 32,
              fit: BoxFit.contain, // Maintains aspect ratio
            ),
          ),
        ],
      ),
      elevation: 0,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
