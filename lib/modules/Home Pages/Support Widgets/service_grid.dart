import 'package:flutter/material.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/constants/colors.dart';

class ServiceGrid extends StatelessWidget {
  final double width;
  final double height;

  const ServiceGrid({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
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
        maxCrossAxisExtent: width *
            0.38, // Each item will have a max width of (200 == w * 0.38) pixels
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8, // Adjust height-to-width ratio
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
          height: height * 0.11,
          width: width * 0.25,
          decoration: BoxDecoration(
            color: CustomColors.containerBg,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          serviceName,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
