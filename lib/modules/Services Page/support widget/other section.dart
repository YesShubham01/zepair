// import 'package:flutter/material.dart';

// import '../../../utils/custom widgets/custom_outline_card_widget.dart';
// import '../../../utils/custom widgets/custom_text.dart';

// class OtherServicesSection extends StatelessWidget {
//   const OtherServicesSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const CustomText(
//           text: "Other Services",
//           fontFamily: FontType.sfPro,
//           size: 24,
//           weight: FontWeight.bold,
//         ),
//         const SizedBox(height: 15),
//         CustomCardWidget(
//           child: ListTile(
//             title: const CustomText(text: "Installation/Uninstallation", fontFamily: FontType.sfPro, size: 18),
//             trailing: const Icon(Icons.arrow_drop_down),
//           ),
//         ),
//         const SizedBox(height: 10),
//         CustomCardWidget(
//           child: ListTile(
//             title: const CustomText(text: "Any other service", fontFamily: FontType.sfPro, size: 18),
//             trailing: const Icon(Icons.arrow_drop_down),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/backend/service_detail_backend.dart';
import 'package:zepair/models/service_detail_model.dart';
import 'package:zepair/modules/Services/service_detail.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class OtherServicesSection extends StatefulWidget {
  final String serviceCategory;
  const OtherServicesSection({super.key, required this.serviceCategory});

  @override
  _OtherServicesSectionState createState() => _OtherServicesSectionState();
}

class _OtherServicesSectionState extends State<OtherServicesSection> {
  String? _expandedService;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ServiceModel>(
      stream:
          ServiceBackendService().fetchOtherServices(widget.serviceCategory),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.otherServices.isEmpty) {
          return const Center(child: Text("No additional services available"));
        }

        Map<String, List<Map<String, dynamic>>> otherServices =
            snapshot.data!.otherServices;

        return ListView.builder(
          padding: const EdgeInsets.only(top: 10),
          physics: const BouncingScrollPhysics(), // ✅ Allow separate scrolling
          shrinkWrap: true,
          itemCount: otherServices.length,
          itemBuilder: (context, index) {
            String docName = otherServices.keys.elementAt(index);
            List<Map<String, dynamic>> servicesList = otherServices[docName]!;

            return Column(
              children: [
                CustomCardWidget(
                  child: Column(
                    children: [
                      ListTile(
                        title: CustomText(
                          text: docName,
                          fontFamily: FontType.sfPro,
                          size: 18,
                          weight: FontWeight.normal,
                        ),
                        trailing: IconButton(
                          iconSize: 32,
                          icon: Icon(
                            _expandedService == docName
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                          ),
                          onPressed: () {
                            setState(() {
                              _expandedService = (_expandedService == docName)
                                  ? null
                                  : docName;
                            });
                          },
                        ),
                      ),
                      if (_expandedService == docName)
                        Column(
                          children: servicesList.map((service) {
                            return _buildServiceDetails(service, context);
                          }).toList(),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
              ],
            );
          },
        );
      },
    );
  }
}

Widget _buildServiceDetails(
    Map<String, dynamic> service, BuildContext context) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;
  String imagePath = service["image"] ?? "";
  double price =
      (service["price"] is num) ? (service["price"] as num).toDouble() : 0.0;

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // Ensure alignment
          children: [
            // Image inside Card
            CustomCardWidget(
              child: SizedBox(
                height: h * 0.075,
                width: w * 0.2,
                child: Image.asset(imagePath),
              ),
            ),
            SizedBox(width: w * 0.03),

            // Column with Proper Alignment
            Column(
              spacing: 0.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align text with image
              children: [
                CustomText(
                  text: service["title"],
                  fontFamily: FontType.sfPro,
                  size: 16,
                  weight: FontWeight.w600,
                ),
                SizedBox(
                    height: h * 0.001), // Reduce gap between title and price
                CustomText(
                  text: "₹${price.toStringAsFixed(2)}",
                  fontFamily: FontType.sfPro,
                  size: 14,
                  weight: FontWeight.bold,
                ),
                // SizedBox(
                //     height: h * 0.001), // Reduce gap between price and button
                TextButton(
                  onPressed: () {
                    // Navigate to service details page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServiceDetailPage(
                          service: service["title"],
                          price: (service["price"] as num?)?.toDouble() ?? 0.0,
                          description:
                              service["description"] ?? "No Description",
                          image: imagePath,
                        ),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    // minimumSize: Size(0, 0),
                  ),
                  child: CustomText(
                    text: "View Details",
                    fontFamily: FontType.sfPro,
                    size: 14,
                    color: Colors.blue,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Divider(
          color: Colors.grey[300], thickness: 1), // 🔹 Line after each service
    ],
  );
}
