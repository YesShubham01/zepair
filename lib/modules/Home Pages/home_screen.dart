import 'package:flutter/material.dart';
import 'package:zepair/devs/notes.dart';
import 'package:zepair/modules/Home%20Pages/home_page.dart';
import 'package:zepair/modules/Warranty%20Page/warranty_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = const [
    HomePage(),
    NotesForDevs(),
    WarrantyPage(),
    NotesForDevs(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.calendar_month), label: 'Bookings'),
          NavigationDestination(
              icon: Icon(Icons.verified_user), label: 'Warranty'),
          NavigationDestination(
              icon: Icon(Icons.headphones_outlined), label: 'Contact Us'),
        ],
      ),
    );
  }
}
