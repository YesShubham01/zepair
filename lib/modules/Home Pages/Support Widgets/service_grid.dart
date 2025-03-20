import 'package:flutter/material.dart';
import 'package:zepair/backend/service_detail_backend.dart';
import 'package:zepair/models/service_detail_model.dart';
import 'package:zepair/modules/AC%20repair/support%20widget/appointement.dart';
import 'package:zepair/modules/Services/service_detail.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class ServiceGrid extends StatefulWidget {
  const ServiceGrid({super.key});

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

    return StreamBuilder<List<ServiceModel>>(
      stream: ServiceBackendService()
          .getAvailableServices(), // 🔥 Firestore real-time stream
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator()); // 🌀 Show loading
        }

        if (snapshot.hasError) {
          return Center(
              child: Text("Error: ${snapshot.error}")); // 🚨 Error handling
        }

        List<ServiceModel>? services = snapshot.data;

        if (services == null || services.isEmpty) {
          return const Center(
              child: Text("No services available")); // 🚫 No data case
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: w * 0.38, // Adjust max width per item
            crossAxisSpacing: 10,
            mainAxisSpacing: 0,
            childAspectRatio: 0.75,
          ),
          itemCount: services.length,
          itemBuilder: (context, index) {
            return serviceCard(services[index]);
          },
        );
      },
    );
  }

  Widget serviceCard(ServiceModel serviceData) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => AppointmentSection()
        ));
      },
      child: Column(
        children: [
          CustomCardWidget(
            child: SizedBox(
              height: h * 0.09,
              width: w * 0.25,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(serviceData
                    .imagePath), // 🔥 Now loading images from Firestore
              ),
            ),
          ),
          const SizedBox(height: 5),
          CustomText(
            text: serviceData.title,
            alignment: TextAlign.center,
            size: 16,
            fontFamily: FontType.balooBhai2,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
