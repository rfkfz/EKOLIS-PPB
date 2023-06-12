// ignore_for_file: camel_case_types

import 'package:ekolis/pages/home.dart';
import 'package:ekolis/pages/profile.dart';
import 'package:ekolis/pages/daya.dart';
import 'package:ekolis/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class berandaScreen extends StatefulWidget {
  const berandaScreen({super.key});

  @override
  State<berandaScreen> createState() => _berandaScreenState();
}

class _berandaScreenState extends State<berandaScreen> {
  int _selectedIndex = 0;
  void _navigateButtonBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    AwalPage(),
    DayaPage(),
    ProfilePage(),
    settingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.cyan,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
          child: GNav(
            backgroundColor: Colors.cyan,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.cyan.shade600,
            gap: 8,
            padding: const EdgeInsets.all(16),
            onTabChange: (index) {
              _navigateButtonBar(index);
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.electric_bolt_sharp,
                text: 'Daya',
              ),
              GButton(
                icon: Icons.person_2_sharp,
                text: 'Profile',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
