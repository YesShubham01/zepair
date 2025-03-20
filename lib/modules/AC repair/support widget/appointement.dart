import 'package:flutter/material.dart';
import 'package:zepair/backend/service_detail_backend.dart';
import 'package:zepair/models/service_detail_model.dart';
import 'package:zepair/modules/Services/service_detail.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AppointmentSection extends StatelessWidget {
  const AppointmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: "Book Appointment",
          size: 24,
          weight: FontWeight.bold,
          fontFamily: FontType.sfPro,
        ),
        SizedBox(height: h * 0.01),
        FutureBuilder<ServiceModel>(
          future: ServiceBackendService().fetchServices(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.mainServices.isEmpty) {
              return const Center(child: Text("No services available"));
            }

            List<Map<String, dynamic>> services = List<Map<String, dynamic>>.from(snapshot.data!.mainServices);

            return GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.2,
              ),
              itemCount: services.length,
              itemBuilder: (context, index) {
                String imageUrl = services[index]["image"] ?? "";
                String title = services[index]["title"] ?? "No Title";
                String description = services[index]["description"] ?? "No Description";
                double price = (services[index]["price"] as num).toDouble();
                String image = services[index]["image"]?.toString() ?? "";



                return GestureDetector(
                  onTap: () {
                    // Navigate to ServiceDetailScreen with service details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServiceDetailPage(
                          service: title, price: price, description: description
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      CustomCardWidget(
                        child: Container(
                          height: h * 0.05,
                          width: w * 0.23,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: imageUrl.isNotEmpty
                                ? DecorationImage(
                                    image: imageUrl.startsWith("http") 
                                        ? NetworkImage(imageUrl) 
                                        : AssetImage(imageUrl) as ImageProvider,
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.008),
                      CustomText(
                        text: title,
                        size: 16,
                        fontFamily: FontType.balooBhai2,
                        alignment: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}


