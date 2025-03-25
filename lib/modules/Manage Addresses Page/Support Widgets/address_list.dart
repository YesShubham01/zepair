import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/modules/Manage%20Addresses%20Page/Support%20Widgets/address_card.dart';
import 'package:zepair/models/user_detail_model.dart';

class AddressList extends StatelessWidget {
  final List<AddressModel> addresses;
  final AddressModel? selectedAddress;
  final Function(AddressModel) onAddressSelected;
  final double width;
  final double height;

  const AddressList({
    super.key,
    required this.addresses,
    required this.selectedAddress,
    required this.onAddressSelected,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: addresses.length,
      separatorBuilder: (context, index) => Gap(height * 0.02),
      itemBuilder: (context, index) {
        final address = addresses[index];
        final bool isSelected = selectedAddress?.address == address.address;

        print("Address: ${address.address}, Selected: $isSelected");
        return GestureDetector(
          onTap: () => {
            print("Tapped Address: ${address.address}"),
            onAddressSelected(address),
          },
          child: AddressCard(
            address: address,
            isSelected: isSelected,
          ),
        );
      },
    );
  }
}
