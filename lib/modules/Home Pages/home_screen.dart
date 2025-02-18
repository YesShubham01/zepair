import 'package:flutter/material.dart';
import 'package:zepair/modules/Contact%20Page/contactUs.dart';
import 'package:zepair/modules/Home%20Pages/home_page.dart';
import 'package:zepair/modules/Warranty%20Page/warranty_page.dart';
import 'package:zepair/modules/Booking%20Page/bookings_page.dart';
import 'package:zepair/utils/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double w;
  late double h;

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
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;

    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(), // Disable manual swipe
          children: _pages,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        // backgroundColor: const Color.fromARGB(255, 245, 243, 228),
        // indicatorColor: CustomColors.primary,
        height: h * 0.085,
        elevation: 10,
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
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: time), // Adjust speed
      curve: Curves.easeInOut, // Smooth transition
    );
  }
}
