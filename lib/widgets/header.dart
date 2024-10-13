import 'package:flutter/material.dart';
import 'package:myapp/config/constants/colors.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const Header({super.key, this.height = 64});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Deelay.neutral900,
      toolbarHeight: height,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: const BoxConstraints(
              maxHeight: 64,
            ),
            child: Image.asset(
              'assets/images/logo.png',
              height: 32,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      elevation: 0,
      surfaceTintColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
