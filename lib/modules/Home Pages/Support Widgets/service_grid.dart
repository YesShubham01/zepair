import 'package:flutter/material.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class ServiceGrid extends StatefulWidget {
  const ServiceGrid({
    super.key,
  });

  @override
  State<ServiceGrid> createState() => _ServiceGridState();
}

class _ServiceGridState extends State<ServiceGrid> {
  late double w;
  late double h;

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;

    List<String> services = [
      "AC Repair & Service",
      "Refrigerator Repair",
      "Washing Machine Repair",
      "Geyser Repair & Service",
      "Television Repair",
      "Inverter Repair & Service",
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: w *
            0.38, // Each item will have a max width of (200 == w * 0.38) pixels
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75, // Adjust height-to-width ratio
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        return serviceCard(services[index]);
      },
    );
  }

  Widget serviceCard(String serviceName) {
    return Column(
      children: [
        Container(
          height: h * 0.11,
          width: w * 0.25,
          decoration: BoxDecoration(
            color: CustomColors.containerBg,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 5),
        CustomText(
            text: serviceName,
            size: 16,
            fontFamily: FontType.balooBhai2,
            color: Colors.black),
      ],
    );
  }
}
