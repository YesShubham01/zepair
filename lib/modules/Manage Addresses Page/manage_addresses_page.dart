import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/modules/Location%20Permission%20Bottom%20Sheet/location_permission_bottom_sheet.dart';
import 'package:zepair/modules/Manage%20Addresses%20Page/Support%20Widgets/address_data.dart';
import 'package:zepair/modules/Manage%20Addresses%20Page/Support%20Widgets/address_list.dart';
import 'package:zepair/modules/Add%20New%20Address%20Page/add_new_address.dart';
import 'package:zepair/modules/bill%20page/bill_page.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_button.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';
import 'package:zepair/utils/custom%20widgets/custom_appbar.dart';

class ManageAddressesPage extends StatefulWidget {
  const ManageAddressesPage({super.key});

  @override
  State<ManageAddressesPage> createState() => _ManageAddressesPageState();
}

class _ManageAddressesPageState extends State<ManageAddressesPage> {
  late double w;
  late double h;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   showModalBottomSheet(
    //     context: context,
    //     isDismissible: false,
    //     enableDrag: false,
    //     shape: const RoundedRectangleBorder(
    //       borderRadius: BorderRadius.vertical(
    //         top: Radius.circular(16),
    //       ),
    //     ),
    //     builder: (context) => const LocationPermissionBottomSheet(),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    w = size.width;
    h = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          const CustomAppBar(applyBackButton: true, title: "Manage Addresses"),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.005),
        child: Column(
          children: [
            Gap(h * 0.015),
            const Divider(height: 1), // First separator
            _buildAddAddressButton(),
            const Divider(height: 1), // Second separator
            Gap(h * 0.015),
            AddressList(
              addresses: dummyAddresses,
              width: w,
              height: h,
            ),
            const Spacer(),
            _buildConitnueButton(),
            Gap(h * 0.1),
          ],
        ),
      ),
    );
  }

  Widget _buildAddAddressButton() {
    return TextButton(
      onPressed: () {
        // Handle add address
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const AddNewAddressPage()));
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: h * 0.015),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.add, color: CustomColors.primary),
          Gap(w * 0.02),
          const CustomText(
            text: "Add another address",
            size: 20,
            color: CustomColors.primary,
            weight: FontWeight.w500,
            fontFamily: FontType.balooBhai2,
          ),
        ],
      ),
    );
  }

  _buildConitnueButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(w * 0.01, h * 0.018, 0, 0),
      child: CustomButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => BillScreen()));
        },
        text: "Confirm Address",
      ),
    );
  }
}
