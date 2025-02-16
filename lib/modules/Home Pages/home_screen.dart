import 'package:flutter/material.dart';
import 'package:zepair/modules/Contact%20Page/contactUs.dart';
import 'package:zepair/modules/Home%20Pages/home_page.dart';
import 'package:zepair/modules/Warranty%20Page/warranty_page.dart';
import 'package:zepair/modules/Booking%20Page/bookings_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  final List<Widget> _pages = const [
    HomePage(),
    SchedulePage(),
    WarrantyPage(),
    ContactUsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(), // Disable manual swipe
          children: _pages,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _onItemTapped(index);
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

  void _onItemTapped(int index) {
    int numberOfPagesNeedToSwipe = (_selectedIndex - index).abs();

    int time;
    switch (numberOfPagesNeedToSwipe) {
      case 1:
        time = 200;
        break;
      case 2:
        time = 300;
        break;
      case 3:
        time = 400;
        break;
      default:
        time = 500;
    }
    print(time);
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: time), // Adjust speed
      curve: Curves.easeInOut, // Smooth transition
    );
  }
}
