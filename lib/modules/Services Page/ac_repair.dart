// import 'package:flutter/material.dart';
// import 'package:zepair/utils/custom%20widgets/custom_appbar.dart';
// import '../../utils/custom widgets/custom_outline_card_widget.dart';
// import '../../utils/custom widgets/custom_text.dart';
// import 'support widget/appointement.dart';
// import 'support widget/coupon.dart';
// import 'support widget/other section.dart';
// import 'support widget/top section.dart';
// import 'support widget/warranty.dart';

// class ACServicePage extends StatelessWidget {
//   const ACServicePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(''),
//         leading: const Icon(Icons.arrow_back),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: w * 0.05),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TopImagePlaceholder(height: h * 0.225, width: w * 0.93),
//               SizedBox(height: h * 0.006),
//               CustomText(text: "AC Repair & Service",size: 24,fontFamily: FontType.sfPro,),

//               const WarrantySection(),
//               SizedBox(height: h * 0.006),
//               const CouponSection(),
//               SizedBox(height: h * 0.006),
//               const AppointmentSection(),
//               SizedBox(height: h * 0.006),
//               const OtherServicesSection(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:zepair/models/service_detail_model.dart';
import 'package:zepair/modules/Services%20Page/support%20widget/appointement.dart';
import 'package:zepair/modules/Services%20Page/support%20widget/other%20section.dart';
import 'package:zepair/modules/Services%20Page/support%20widget/top%20section.dart';
import 'package:zepair/modules/Services%20Page/support%20widget/warranty.dart';
import 'package:zepair/modules/bill%20page/support%20widget/coupon.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

// class ACServicePage extends StatefulWidget {
//   final ServiceModel serviceModel;

//   const ACServicePage({super.key, required this.serviceModel});

//   @override
//   State<ACServicePage> createState() => _ACServicePageState();
// }

// class _ACServicePageState extends State<ACServicePage> {
//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               // Top Image
//               TopImagePlaceholder(height: h * 0.230, width: w),
//               SizedBox(height: h * 0.006),

//               // Rest of the page
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: w * 0.05),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: h * 0.019),
//                         CustomText(
//                           text: widget.serviceModel.title, // ✅ Dynamic Title
//                           size: 24,
//                           fontFamily: FontType.sfPro,
//                           weight: FontWeight.bold,
//                         ),
//                         SizedBox(height: h * 0.010),
//                         const WarrantySection(),
//                         SizedBox(height: h * 0.010),
//                         const CouponSection(),
//                         SizedBox(height: h * 0.010),
//                         AppointmentSection(
//                           serviceCategory: widget.serviceModel.title,
//                         ), // ✅ Pass serviceModel
//                         SizedBox(height: h * 0.010),
//                         OtherServicesSection(
//                           serviceCategory: widget.serviceModel.title,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           // Transparent AppBar on Top
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: AppBar(
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               title: Text(''),
//               leading: IconButton(
//                 icon: const Icon(Icons.arrow_back, color: Colors.black),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class ACServicePage extends StatefulWidget {
  final ServiceModel serviceModel;

  const ACServicePage({super.key, required this.serviceModel});

  @override
  State<ACServicePage> createState() => _ACServicePageState();
}

class _ACServicePageState extends State<ACServicePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // Top Image
              TopImagePlaceholder(height: h * 0.230, width: w),
              SizedBox(height: h * 0.006),

              // Full page scrollable content
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: h * 0.019),
                        CustomText(
                          text: widget.serviceModel.title, // ✅ Dynamic Title
                          size: 24,
                          fontFamily: FontType.sfPro,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(height: h * 0.010),
                        WarrantySection(),
                        SizedBox(height: h * 0.010),
                        CouponSection(),
                        SizedBox(height: h * 0.010),
                        AppointmentSection(
                          serviceCategory: widget.serviceModel.title,
                        ),
                        SizedBox(height: h * 0.010),
                        CustomText(
                          text: "Other Services",
                          fontFamily: FontType.sfPro,
                          size: 24,
                          weight: FontWeight.bold,
                        ),
                        // ✅ OtherServicesSection will expand naturally
                        OtherServicesSection(
                          serviceCategory: widget.serviceModel.title,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Transparent AppBar on Top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
