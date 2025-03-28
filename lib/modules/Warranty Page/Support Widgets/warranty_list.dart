import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/models/warranty_model.dart';
import 'package:zepair/modules/Warranty%20Page/Support%20Widgets/warranty_card.dart';
import 'package:zepair/modules/Warranty%20Page/Support%20Widgets/warranty_data.dart';
import 'package:zepair/utils/custom%20widgets/custom_loading_screen.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';
import 'package:zepair/utils/custom%20widgets/serviceEnum.dart';

class WarrantyList extends StatelessWidget {
  final Stream<List<WarrantyModel>> warrantyStream;
  const WarrantyList({super.key, required this.warrantyStream});

  // final List<Warranty> warranties;
  // final double width;
  // final double height;

  // const WarrantyList({
  //   super.key,
  //   required this.warranties,
  //   required this.width,
  //   required this.height,
  // });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<List<WarrantyModel>>(
        stream: warrantyStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CustomLoadingScreen());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: CustomText(text: "No warranties found"));
          }

          List<WarrantyModel> warranties = snapshot.data!;
          return ListView.separated(
            shrinkWrap: true,
            itemCount: warranties.length,
            separatorBuilder: (context, index) => const Gap(10),
            itemBuilder: (context, index) => TweenAnimationBuilder(
              duration: Duration(
                  milliseconds:
                      300 + (index * 100)), // Delayed animation per item
              tween: Tween<double>(begin: 0, end: 1),
              curve: Curves.easeOut, // Smooth animation
              builder: (context, double value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.scale(
                    scale: value,
                    child: child,
                  ),
                );
              },
              child: WarrantyCard(warranty: warranties[index]),
            ),
          );
        },
      ),
    );
  }
}
