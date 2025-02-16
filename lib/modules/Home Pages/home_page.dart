import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/modules/Home%20Pages/Support%20Widgets/custom_searchbar.dart';
import 'package:zepair/modules/Home%20Pages/Support%20Widgets/service_grid.dart';
import 'package:zepair/modules/Manage%20Addresses%20Page/manage_addresses_page.dart';
import 'package:zepair/modules/Service%20Progress/service_progress.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double w;
  late double h;

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: header(),
        actions: <Widget>[
          _getNotificationButton(),
          _getProfileAvatar(),
          Gap(w * 0.05),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(w * 0.05),
        children: [
          _buildBanner(),
          Gap(h * 0.02),
          const CustomSearchBar(),
          Gap(h * 0.02),
          const CustomText(
              text: "Repair & Service",
              color: Colors.black,
              fontFamily: FontType.sfPro,
              size: 24),
          Gap(h * 0.02),
          const ServiceGrid(),
        ],
      ),
      // bottomNavigationBar: const ServiceInProgressBottomBar(),
    );
  }

  Widget _buildBanner() {
    return Container(
      height: h * 0.18,
      decoration: BoxDecoration(
        color: CustomColors.containerBg,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
    );
  }

  Widget header() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ManageAddressesPage()));
          },
          child: Row(
            children: [
              const Icon(Icons.location_on, color: Colors.orange),
              Gap(w * 0.0125),
              const CustomText(
                  text: "Home",
                  size: 20,
                  weight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: FontType.sfPro),
              const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
            ],
          ),
        )
      ],
    );
  }

  _getProfileAvatar() {
    return const CircleAvatar(
      foregroundColor: CustomColors.lightBlue,
    );
  }

  _getNotificationButton() {
    return IconButton(
      icon: const Badge(
        child: Icon(
          Icons.notifications,
        ),
      ),
      onPressed: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const NotificationPage(),
        //   ),
        // );
      },
    );
  }
}
