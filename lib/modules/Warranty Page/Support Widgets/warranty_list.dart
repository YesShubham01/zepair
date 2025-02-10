import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/modules/Warranty%20Page/Support%20Widgets/warranty_card.dart';
import 'package:zepair/modules/Warranty%20Page/Support%20Widgets/warranty_data.dart';

class WarrantyList extends StatelessWidget {
  final List<Warranty> warranties;
  final double width;
  final double height;

  const WarrantyList({
    super.key,
    required this.warranties,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: warranties.length,
      separatorBuilder: (context, index) => Gap(height * 0.02),
      itemBuilder: (context, index) => WarrantyCard(
        title: warranties[index].title,
        onDate: warranties[index].onDate,
        validTill: warranties[index].validTill,
        width: width,
        height: height,
      ),
    );
  }
}
