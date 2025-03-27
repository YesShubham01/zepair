import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:zepair/models/user_detail_model.dart';
import 'package:zepair/modules/Home%20Pages/Support%20Widgets/custom_searchbar.dart';
import 'package:zepair/modules/Home%20Pages/Support%20Widgets/service_grid.dart';
import 'package:zepair/modules/Manage%20Addresses%20Page/manage_addresses_page.dart';
import 'package:zepair/modules/Notification%20Page/notification_page.dart';
import 'package:zepair/modules/Profile%20Page/Support%20Widgets/profile_card.dart';
import 'package:zepair/modules/Profile%20Page/profile_page.dart';
import 'package:zepair/modules/Service%20Progress/service_progress.dart';
import 'package:zepair/provider/user_datails_provider.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';
import 'package:zepair/utils/custom%20widgets/custom_title.dart';

import '../Location Permission Bottom Sheet/location_permission_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double w;
  late double h;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      UserDetailModel userDetails =
          context.read<UserDetailsProvider>().userDetail;

      if (userDetails.addresses == null || userDetails.addresses!.isEmpty) {
        showLocationPermissionSheet();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: addressBar(),
        actions: <Widget>[
          _getNotificationButton(),
          _getProfileAvatar(),
          Gap(w * 0.05),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.01),
        children: [
          _buildBanner(),
          Gap(h * 0.012),
          const CustomSearchBar(),
          Gap(h * 0.02),
          CustomTitle(
            text: "Repair & Service",
          ),
          Gap(h * 0.006),
          const ServiceGrid(),
        ],
      ),
      // bottomNavigationBar: const ServiceInProgressBottomBar(),
    );
  }

  Widget _buildBanner() {
    return CustomCardWidget(
      child: Container(
        height: h * 0.15,
        alignment: Alignment.center,
      ),
    );
  }

  Widget addressBar() {
    UserDetailModel userDetails =
        context.watch<UserDetailsProvider>().userDetail;

    if (userDetails.addresses == null || userDetails.addresses!.isEmpty) {
      return const CustomText(
        text: "No Address Available",
        size: 18,
        weight: FontWeight.bold,
      );
    }

    // ✅ Get the selected address using selectedAddressIndex
    int selectedIndex = userDetails.selectedAddressIndex ?? 0;
    AddressModel selectedAddress = userDetails.addresses![selectedIndex];

    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const ManageAddressesPage(
                  showConfirmButton: false,
                ),
              ),
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.location_on,
                  color: Colors.orange), // 📍 Location Icon
              Gap(w * 0.0125),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: selectedAddress
                            .type, // 🏠 Address Type (e.g., Home, Work)
                        size: 18,
                        weight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black54, size: 18),
                    ],
                  ),
                  Gap(h * 0.001),
                  CustomText(
                    text: _shortenAddress(selectedAddress.address),
                    size: 16,
                    color: Colors.grey,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  String _shortenAddress(String address) {
    List<String> words = address.split(' '); // Split address into words
    if (words.length > 5) {
      return words.sublist(0, 5).join(' ') +
          '...'; // Show first 5 words + "..."
    }
    return address;
  }

  _getProfileAvatar() {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const ProfileScreen()));
      },
      child: const CircleAvatar(
        foregroundColor: CustomColors.lightBlue,
      ),
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
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const NotificationPage(),
          ),
        );
      },
    );
  }

  void showLocationPermissionSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const LocationPermissionBottomSheet();
      },
    );
  }
}
