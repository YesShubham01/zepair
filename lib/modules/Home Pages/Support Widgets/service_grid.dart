import 'package:flutter/material.dart';
import 'package:zepair/modules/Services/service_detail.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';
import 'package:zepair/utils/custom%20widgets/serviceEnum.dart';

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

    List<Device> services = [
      Device.ac,
      Device.refrigerator,
      Device.washingMachine,
      Device.geyser,
      Device.television,
      Device.inverter,
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: w *
            0.38, // Each item will have a max width of (200 == w * 0.38) pixels
        crossAxisSpacing: 10,
        mainAxisSpacing: 0,
        childAspectRatio: 0.75, // Adjust height-to-width ratio
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        return serviceCard(services[index]);
      },
    );
  }

  Widget serviceCard(Device serviceData) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ServiceDetailPage(
                  service: serviceData.title,
                )));
      },
      child: Column(
        children: [
          CustomCardWidget(
            child: SizedBox(
              height: h * 0.09,
              width: w * 0.25,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(serviceData.icon),
              ),
            ),
          ),
          const SizedBox(height: 5),
          CustomText(
              text: serviceData.title,
              alignment: TextAlign.center,
              size: 16,
              fontFamily: FontType.balooBhai2,
              color: Colors.black),
        ],
      ),
    );
  }
}
