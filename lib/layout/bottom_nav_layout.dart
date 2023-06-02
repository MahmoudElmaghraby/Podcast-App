import 'package:flutter/material.dart';
import 'package:podcast_app/modules/home/home_sceen.dart';
import 'package:podcast_app/modules/listen/listen_screen.dart';
import 'package:podcast_app/modules/profile/profile_screen.dart';
import 'package:podcast_app/modules/search/search_screen.dart';
import 'package:podcast_app/shared/components/components.dart';

class BottomNavLayout extends StatefulWidget {
  const BottomNavLayout({super.key});

  @override
  State<BottomNavLayout> createState() => _BottomNavLayoutState();
}

class _BottomNavLayoutState extends State<BottomNavLayout> {
  int _selectedIndex = 0;
  static const List<Widget> _screens = [
    HomeScreen(),
    ListenScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.headphones),
            label: 'Listen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
      body: _screens[_selectedIndex],
    );
  }
}
