import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zepair/backend/service_detail_backend.dart';
import 'package:zepair/models/service_detail_model.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class OtherServicesSection extends StatefulWidget {
  const OtherServicesSection({super.key});

  @override
  _OtherServicesSectionState createState() => _OtherServicesSectionState();
}

class _OtherServicesSectionState extends State<OtherServicesSection> {
  Map<int, bool> _expandedStates = {}; // 🔹 Track which dropdown is open

  @override
  Widget build(BuildContext context) {
    
    double h = MediaQuery.of(context).size.height;

    return FutureBuilder<ServiceModel>(
      future: ServiceBackendService().fetchServices(), // 🔹 Fetching services from Firestore
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.otherServices.isEmpty) {
          return const Center(child: Text("No services available"));
        }

        List<Map<String, dynamic>> otherservices =
            List<Map<String, dynamic>>.from(snapshot.data!.otherServices);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: "Other Services",
              fontFamily: FontType.sfPro,
              size: 24,
              weight: FontWeight.bold,
            ),
            SizedBox(height: h * 0.01),

            // 🔹 Dynamically creating dropdowns for each service
            ...otherservices.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, dynamic> service = entry.value; // 🔹 Each service from array

              return Column(
                children: [
                  CustomCardWidget(
                    child: Column(
                      children: [
                        ListTile(
                          title: CustomText(
                            text: service["title"], // 🔹 Fetch title from Firestore
                            fontFamily: FontType.sfPro,
                            size: 18,
                          ),
                          trailing: IconButton(
                            icon: Icon(_expandedStates[index] == true
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down),
                            onPressed: () {
                              setState(() {
                                _expandedStates[index] =
                                    !(_expandedStates[index] ?? false);
                              });
                            },
                          ),
                        ),
                        if (_expandedStates[index] == true)
                          _buildServiceDetails(service), // 🔹 Show image, price, desc
                      ],
                    ),
                  ),
                  SizedBox(height: h * 0.01),
                ],
              );
            }).toList(),
          ],
        );
      },
    );
  }

  /// 🔹 Function to show image, price & description
  Widget _buildServiceDetails(Map<String, dynamic> service) {
     double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    String imagePath = service["image"] ?? "";

    Widget imageWidget;
    if (imagePath.startsWith("http")) {
      // 🔹 Load network image if it's a URL
      imageWidget = Image.network(imagePath, height: h*0.07, fit: BoxFit.cover);
    } else {
      // 🔹 Load local asset image if it's an asset path
      imageWidget = Image.asset(imagePath, height: h*0.07, fit: BoxFit.cover);
    }

    double price = (service["price"] is num) ? (service["price"] as num).toDouble() : 0.0;

    return Column(
      children: [
        imageWidget,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomText(
            text: service["description"],
            fontFamily: FontType.sfPro,
            size: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomText(
            text: "Price: ₹${price.toStringAsFixed(2)}", // 🔹 Ensures price is formatted correctly
            fontFamily: FontType.sfPro,
            size: 16,
            weight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}



