import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zepair/modules/Contact%20Page/contactUs.dart';
import 'package:zepair/modules/Home%20Pages/home_page.dart';
import 'package:zepair/modules/Warranty%20Page/warranty_page.dart';
import 'package:zepair/modules/Booking%20Page/bookings_page.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

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
  void initState() {
    super.initState();
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user == null) {
      print("not loggined");
    } else {
      print("user logged in");
      print(user.phoneNumber);
    }
  }

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
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
        activeColor: CustomColors.primary,
        color: Colors.black,
        height: 55,
        elevation: 10,
        style: TabStyle.react,
        items: const [
          TabItem(
            icon: Icons.home,
            title: 'Home',
          ),
          TabItem(icon: Icons.calendar_month, title: 'Bookings'),
          TabItem(icon: Icons.verified_user, title: 'Warranty'),
          TabItem(icon: Icons.headphones_outlined, title: 'Contact Us'),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _onItemTapped(index);
            _selectedIndex = index;
          });
        },
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
