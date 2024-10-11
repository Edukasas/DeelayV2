import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true, // Ensures the title is centered
      title: const Text(
        'Deelay', // This is the static text, can later be replaced with a logo.
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      elevation:
          0, // You can customize the elevation or other properties as needed.
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
