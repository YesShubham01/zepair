import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:provider/provider.dart';
import 'package:zepair/backend/authentication_backend.dart';
import 'package:zepair/modules/Manage%20Addresses%20Page/manage_addresses_page.dart';
import 'package:zepair/modules/Profile%20Page/Support%20Widgets/profile_card.dart';
import 'package:zepair/modules/Profile%20Page/Support%20Widgets/profile_menuItem.dart';
import 'package:zepair/modules/Profile%20Page/Support%20Widgets/profile_page_header.dart';
import 'package:zepair/provider/user_datails_provider.dart';
import 'package:zepair/utils/custom%20widgets/custom_appbar.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_button.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late double w;
  late double h;
  late double space;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;
    space = h * 0.015; // adjust space between button tiles from here.

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 248, 229),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfilePageHeader(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              child: Column(
                children: [
                  Gap(space),
                  getProfileActions(),
                  Gap(space),
                  getProfileMenu(),
                  Gap(space),
                  getReferEarnSection(),
                  Gap(space),
                  getLogoutButton(),
                  Gap(h * 0.1),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getProfileActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ProfileCard(
            icon: Icons.book,
            text: "My Bookings",
            onTap: () {},
          ),
        ),
        Gap(w * 0.04),
        Expanded(
          child: ProfileCard(
            icon: Icons.headset_mic,
            text: "Help & Support",
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget getProfileMenu() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProfileMenuItem(
          icon: Icons.location_on,
          text: "Manage Addresses",
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const ManageAddressesPage(
                      showConfirmButton: false,
                    )));
          },
        ),
        Gap(space),
        ProfileMenuItem(
          icon: Icons.payment,
          text: "Manage payment methods",
          onTap: () {},
        ),
        Gap(space),
        ProfileMenuItem(
          icon: Icons.settings,
          text: "Settings",
          onTap: () {},
        ),
        Gap(space),
        ProfileMenuItem(
          icon: Icons.info,
          text: "About",
          onTap: () {},
        ),
      ],
    );
  }

  Widget getReferEarnSection() {
    return CustomCardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Refer & earn ₹100",
            size: 18,
            weight: FontWeight.bold,
            fontFamily: FontType.sfPro,
          ),
          const SizedBox(height: 3),
          const CustomText(
            text: "Get ₹100 when your friend completes their first booking",
            size: 16,
            weight: FontWeight.normal,
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[500],
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const CustomText(
              text: "Refer Now!",
              color: Colors.white,
              size: 16,
              fontFamily: FontType.sfPro,
            ),
          ),
        ],
      ).pSymmetric(v: h * 0.01, h: w * 0.03),
    );
  }

  Widget getLogoutButton() {
    return CustomOutlineButton(
      onPressed: () {
        AuthenticationBackend.logOut();
        context
            .read<UserDetailsProvider>()
            .checkAuthenticationAndNavigate(context);
      },
      buttonText: "Logout",
      color: Colors.red,
    );
  }
}
