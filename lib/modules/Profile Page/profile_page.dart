import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/modules/Manage%20Addresses%20Page/manage_addresses_page.dart';
import 'package:zepair/modules/Profile%20Page/Support%20Widgets/profile_card.dart';
import 'package:zepair/modules/Profile%20Page/Support%20Widgets/profile_menuItem.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_appbar.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String name = "Your Name";
  final String phoneNumber = "+91 9876543210";
  late double w;
  late double h;

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: "Profile Page",
        applyBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getProfileHeader(name: name, phoneNumber: phoneNumber),
            Gap(h * 0.02),
            getProfileActions(),
            Gap(h * 0.02),
            getProfileMenu(),
            Gap(h * 0.02),
            getReferEarnSection(),
            Gap(h * 0.02),
            getLogoutButton(),
            Gap(h * 0.1),
          ],
        ),
      ),
    );
  }

  Widget getProfileHeader({
    required String name,
    required String phoneNumber,
  }) {
    return Container(
      padding: EdgeInsets.fromLTRB(w * 0.05, h * 0.01, 0, h * 0.02),
      color: CustomColors.containerBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(h * 0.02),
          CustomText(
            text: name,
            size: 24,
            weight: FontWeight.bold,
            fontFamily: FontType.balooBhai2,
          ),
          Gap(h * 0.001),
          CustomText(
            text: phoneNumber,
            size: 16,
            fontFamily: FontType.balooBhai2,
          ),
          Gap(h * 0.01),
          _buildTapEffectRow(
            text: "Edit Profile",
            icon: Icons.arrow_forward_ios,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildTapEffectRow({
    required String text,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.grey.withOpacity(0.3),
        highlightColor: Colors.grey.withOpacity(0.2),
        child: Row(
          children: [
            CustomText(
              text: text,
              size: 18,
              fontFamily: FontType.balooBhai2,
              weight: FontWeight.w500,
            ),
            Gap(w * 0.012),
            Icon(icon, size: 16),
          ],
        ),
      ),
    );
  }

  Widget getProfileActions() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.05),
      child: Row(
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
      ),
    );
  }

  Widget getProfileMenu() {
    return Column(
      children: [
        ProfileMenuItem(
          icon: Icons.location_on,
          text: "Manage Addresses",
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ManageAddressesPage()));
          },
        ),
        ProfileMenuItem(
          icon: Icons.payment,
          text: "Manage payment methods",
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.settings,
          text: "Settings",
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.info,
          text: "About",
          onTap: () {},
        ),
      ],
    );
  }

  Widget getReferEarnSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.04),
      child: Container(
        padding: EdgeInsets.fromLTRB(w * 0.05, h * 0.017, w * 0.05, h * 0.017),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
        ),
      ),
    );
  }

  Widget getLogoutButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.04),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10),
          side: const BorderSide(color: Colors.red),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Center(
          child: CustomText(
            text: "Logout",
            color: Colors.red,
            size: 22,
          ),
        ),
      ),
    );
  }
}
