// import 'package:flutter/material.dart';
// import 'package:zepair/utils/custom%20widgets/custom_text.dart';

// import '../../../utils/custom widgets/custom_outline_card_widget.dart';

// class AppointmentSection extends StatelessWidget {
//   const AppointmentSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const CustomText(text:
//           "Book Appointment",
//           size: 24, weight: FontWeight.bold,fontFamily:FontType.sfPro),

//         SizedBox(height: h * 0.01),
//         Row(
//           children: [
//             Expanded(
//               child: Column(
//                 children: [
//                   CustomCardWidget(
//                     child: Container(
//                       height: h * 0.10,
//                       width: w * 0.43,
//                       decoration: BoxDecoration(
//                         color: Colors.grey[200],
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: h * 0.008),
//                   const CustomText(text:
//                     "Book a Service",
//                     size: 16, fontFamily: FontType.balooBhai2,
//                     alignment: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(width: w * 0.02),
//             Expanded(
//               child: Column(
//                 children: [
//                   CustomCardWidget(
//                     child: Container(
//                       height: h * 0.10,
//                       width: w * 0.43,
//                       decoration: BoxDecoration(
//                         color: Colors.grey[200],
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: h * 0.008),
//                   const CustomText(text:
//                     "Book Checkup & Repair",size: 16,
//                     fontFamily: FontType.balooBhai2,
//                     alignment: TextAlign.center,

//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:zepair/backend/service_detail_backend.dart';
import 'package:zepair/models/service_detail_model.dart';
import 'package:zepair/modules/Services/service_detail.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';

class AppointmentSection extends StatefulWidget {
  final String serviceCategory; // Example: "AC", "Washing Machine", etc.

  const AppointmentSection({super.key, required this.serviceCategory});

  @override
  State<AppointmentSection> createState() => _AppointmentSectionState();
}

class _AppointmentSectionState extends State<AppointmentSection> {
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
        StreamBuilder<ServiceModel>(
          stream: ServiceBackendService().fetchServices(widget.serviceCategory),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData ||
                snapshot.data!.mainServices.isEmpty) {
              return const Center(child: Text("No services available"));
            }

            List<Map<String, dynamic>> services =
                List<Map<String, dynamic>>.from(snapshot.data!.mainServices);

            // ✅ If only 1 service, show different UI
            if (services.length == 1) {
              return buildSingleServiceUI(services.first, h, w);
            }

            // ✅ If 2 or more, show the grid
            return GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: h * 0.01),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.2,
              ),
              itemCount: services.length,
              itemBuilder: (context, index) {
                return buildServiceCard(services[index], h, w);
              },
            );
          },
        ),
      ],
    );
  }

  /// 🔹 **UI for Single Service**
  Widget buildSingleServiceUI(
      Map<String, dynamic> service, double h, double w) {
    String title = service["title"] ?? "No Title";
    String imageUrl = service["image"] ?? "";

    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * 0.01),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ServiceDetailPage(
                service: title,
                price: (service["price"] as num?)?.toDouble() ?? 0.0,
                description: service["description"] ?? "No Description",
                image: imageUrl,
              ),
            ),
          );
        },
        child: CustomCardWidget(
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: h * 0.007, horizontal: w * 0.02),
            child: Row(
              children: [
                // 🔹 Image/Icon Section
                CustomCardWidget(
                  child: SizedBox(
                    width: w * 0.15, // 20% of screen width
                    height: w * 0.15, // Maintain square aspect ratio
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(imageUrl),
                    ),
                  ),
                ),
                SizedBox(width: w * 0.04),

                // 🔹 Title Text
                Expanded(
                  child: CustomText(
                    text: title,
                    size: 18,
                    fontFamily: FontType.sfPro,
                    weight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🔹 **Card UI for Multiple Services**
  Widget buildServiceCard(Map<String, dynamic> service, double h, double w) {
    String title = service["title"] ?? "No Title";
    String description = service["description"] ?? "No Description";
    double price = (service["price"] as num?)?.toDouble() ?? 0.0;
    String imageUrl = service["image"] ?? "";

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServiceDetailPage(
              service: title,
              price: price,
              description: description,
              image: imageUrl,
            ),
          ),
        );
      },
      child: Column(
        children: [
          CustomCardWidget(
            child: SizedBox(
              height: h * 0.11,
              width: w * 0.45,
              child: Image.asset(imageUrl),
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
  }
}
