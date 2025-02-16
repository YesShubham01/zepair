import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/modules/Manage%20Addresses%20Page/Support%20Widgets/address_card.dart';
import 'package:zepair/modules/Manage%20Addresses%20Page/Support%20Widgets/address_data.dart';

class AddressList extends StatelessWidget {
  final List<Address> addresses;
  final double width;
  final double height;

  const AddressList({
    super.key,
    required this.addresses,
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
      itemBuilder: (context, index) => AddressCard(
        type: addresses[index].type,
        address: addresses[index].address,
        name: addresses[index].name,
        phoneNumber: addresses[index].phoneNumber,
      ),
    );
  }
}
