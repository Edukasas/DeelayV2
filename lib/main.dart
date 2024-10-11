import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Importing the HomeScreen.
import 'screens/statistics_screen.dart'; // Importing the StatisticsScreen.
import 'screens/app_screen.dart'; // Importing the AppScreen.
import 'widgets/footer.dart'; // Importing footer widget.
import 'widgets/header.dart'; // Importing header widget.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(), // Setting HomeScreen as the default screen.
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const AppScreen(),
    const StatisticsScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: _screens[_currentIndex], // Display the current screen.
      bottomNavigationBar: Footer(
        currentIndex: _currentIndex, // Current tab.
        onTap: _onTabTapped, // Handle tab switching.
      ),
    );
  }
}
