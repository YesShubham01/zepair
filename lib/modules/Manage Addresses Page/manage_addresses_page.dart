import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:zepair/backend/authentication_backend.dart';
import 'package:zepair/backend/user_detail_backend_service.dart';
import 'package:zepair/models/user_detail_model.dart';
import 'package:zepair/modules/Add%20New%20Address%20Page/add_new_address.dart';
import 'package:zepair/modules/Manage%20Addresses%20Page/Support%20Widgets/address_list.dart';
import 'package:zepair/modules/bill%20page/bill_page.dart';
import 'package:zepair/provider/user_datails_provider.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_button.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';
import 'package:zepair/utils/custom%20widgets/custom_appbar.dart';

class ManageAddressesPage extends StatefulWidget {
  final bool showConfirmButton;

  const ManageAddressesPage({super.key, required this.showConfirmButton});

  @override
  State<ManageAddressesPage> createState() => _ManageAddressesPageState();
}

class _ManageAddressesPageState extends State<ManageAddressesPage> {
  late double w;
  late double h;
  AddressModel? selectedAddress;

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
            const Divider(height: 1),
            _buildAddAddressButton(),
            const Divider(height: 1),
            Gap(h * 0.015),

            // ✅ Prevent Overflow: Wrap in Expanded
            Expanded(
              child: StreamBuilder<UserDetailModel?>(
                stream: UserService().streamUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data == null) {
                    return const Center(child: Text("No addresses found"));
                  }
                  final user = snapshot.data!;
                  final addresses = user.addresses;
                  if (addresses == null) {
                    return const Center(child: Text("No addresses found"));
                  }

                  return AddressList(
                    addresses: addresses,
                    selectedAddress: selectedAddress,
                    onAddressSelected: (AddressModel address) async {
                      final selectedIndex = addresses.indexOf(address);
                      if (selectedIndex == -1) return;

                      print("Before Update: ${selectedAddress?.address}");

                      setState(() {
                        selectedAddress = address;
                      });

                      print("After Update: ${selectedAddress?.address}");

                      // ✅ Update selected index in provider
                      context
                          .read<UserDetailsProvider>()
                          .updateSelectedAddressIndex(selectedIndex);
                    },
                    width: w,
                    height: h,
                  );
                },
              ),
            ),

            // ✅ Only show confirm button when required
            if (widget.showConfirmButton) _buildConfirmButton(),
            Gap(h * 0.02),
          ],
        ),
      ),
    );
  }

  Widget _buildAddAddressButton() {
    return TextButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const AddNewAddressPage()));
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: h * 0.015),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
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

  Widget _buildConfirmButton() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: h * 0.02), // Ensure padding at bottom
        child: CustomButton(
          onPressed: () {
            if (selectedAddress != null) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BillScreen(selectedAddress: selectedAddress!),
                ),
              );
            }
          },
          text: "Confirm Address",
        ),
      ),
    );
  }
}
