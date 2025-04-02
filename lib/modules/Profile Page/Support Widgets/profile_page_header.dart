import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zepair/backend/authentication_backend.dart';
import 'package:zepair/models/user_detail_model.dart';
import 'package:zepair/provider/user_datails_provider.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_appbar.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class ProfilePageHeader extends StatefulWidget {
  const ProfilePageHeader({super.key});

  @override
  State<ProfilePageHeader> createState() => _ProfilePageHeaderState();
}

class _ProfilePageHeaderState extends State<ProfilePageHeader> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;

    UserDetailModel userDetails =
        context.read<UserDetailsProvider>().userDetail;

    String? name = userDetails.name;
    String? phone = userDetails.phone;
    String? profileUrl = AuthenticationBackend.getProfileImageURL();

    return Container(
      // color: CustomColors.themeGradientStart to CustomColors.themeGradientEnd,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            CustomColors.themeGradientStart,
            CustomColors.themeGradientEnd,
            Color.fromARGB(255, 164, 109, 0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          const CustomAppBar(
            customColor: Colors.transparent,
            title: "Profile Page",
            applyBackButton: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 35, // Adjust size as needed
                backgroundColor:
                    Colors.grey.shade300, // Fallback background color
                backgroundImage:
                    profileUrl != null ? NetworkImage(profileUrl) : null,
                child: profileUrl == null
                    ? const Icon(Icons.person, color: Colors.white, size: 40)
                    : null,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: const Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                    ),
                  ),
                  Gap(h * 0.01),
                  CustomText(
                    text: name ?? "Your Name",
                    color: Colors.white,
                    size: 18,
                  ),
                  const Gap(1),
                  CustomText(
                    text: phone ?? "Phone number",
                    color: Colors.white,
                    size: 14,
                  ),
                ],
              )
            ],
          ).py(h * 0.03).px(w * 0.08),
        ],
      ),
    );
  }
}
