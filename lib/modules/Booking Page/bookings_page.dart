/*import 'package:flutter/material.dart';
import 'package:zepair/modules/Login%20Pages/Support%20Widgets/schedule/widgets/card.dart';
import 'package:zepair/utils/custom%20widgets/custom_appbar.dart';
import 'package:zepair/utils/custom%20widgets/custom_button.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late double h;
  late double w;

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;

    return Scaffold(
      appBar: CustomAppBar(title: "Schedule"),
      body: Column(
        children: [
          // Service List (Scrollable)
          Expanded(
            child: ListView(
              padding:  EdgeInsets.fromLTRB(w*0.05, 0, w*0.05,0.67*h),
              children: [
                ServiceCard(
                  serviceName: "Refrigerator Repair",
                  amountPaid: "100",
                  description: "Single door refrigerator check-up X 1",
                  status: "We will soon assign one of our engineers at your doorstep.",
                ),
                ServiceCard(
                  serviceName: "AC Service",
                  amountPaid: "450",
                  description: "AC Service X 1",
                  status: "Our engineer will be at your doorstep at",
                  highlightedStatus: "10 am tomorrow",
                ),
                ServiceCard(
                  serviceName: "AC Service",
                  amountPaid: "450",
                  description: "AC Service X 1",
                  status: "Our engineer will be at your doorstep at",
                  highlightedStatus: "10 am tomorrow",
                ),
                ServiceCard(
                  serviceName: "AC Service",
                  amountPaid: "450",
                  description: "AC Service X 1",
                  status: "Our engineer will be at your doorstep at",
                  highlightedStatus: "10 am tomorrow",
                ),
              ],
            ),
          ),

          // "Need Help?" Button Positioned at Bottom
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 30),
            child: SizedBox(
              width: w * 0.9,
              height: h * 0.06,
              child: CustomButton(
                buttonText: "Need Help?",
                onPressed: () {
                  print("Need Help button clicked");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/modules/Booking%20Page/Support%20Widget/booking_card.dart';
import 'package:zepair/utils/custom%20widgets/custom_appbar.dart';
import 'package:zepair/utils/custom%20widgets/custom_button.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late double h;
  late double w;
  List<Map<String, String>> serviceList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchServices(); // Fetch services when the screen loads
  }

  Future<void> fetchServices() async {
    await Future.delayed(const Duration(seconds: 0)); // Simulating API call
    setState(() {
      serviceList = [
        {
          "serviceName": "Refrigerator Repair",
          "amountPaid": "100",
          "description": "Single door refrigerator check-up X 1",
          "status": "We will soon assign one of our engineers at your doorstep."
        },
        {
          "serviceName": "AC Service",
          "amountPaid": "450",
          "description": "AC Service X 1",
          "status": "Our engineer will be at your doorstep at",
          "highlightedStatus": "10 am tomorrow"
        },
        {
          "serviceName": "AC Service",
          "amountPaid": "450",
          "description": "AC Service X 1",
          "status": "Our engineer will be at your doorstep at",
          "highlightedStatus": "10 am tomorrow"
        },
        {
          "serviceName": "AC Service",
          "amountPaid": "450",
          "description": "AC Service X 1",
          "status": "Our engineer will be at your doorstep at",
          "highlightedStatus": "10 am tomorrow"
        }
      ];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.of(context).size;
    w = dimensions.width;
    h = dimensions.height;

    return Scaffold(
      appBar: const CustomAppBar(title: "Schedule"),
      body: Column(
        children: [
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator()) // Show loader while fetching
                : ListView.separated(
                    padding: EdgeInsets.fromLTRB(w * 0.02, 0, w * 0.02, h * 0.05),
                    itemCount: serviceList.length,
                    separatorBuilder: (context, index) => SizedBox(height: h * 0.02), // Responsive spacing
                    itemBuilder: (context, index) {
                      var service = serviceList[index];
                      return BookingCard(
                        serviceName: service["serviceName"]!,
                        amountPaid: service["amountPaid"]!,
                        description: service["description"]!,
                        status: service["status"]!,
                        highlightedStatus: service["highlightedStatus"],
                      );
                    },
                  ),
          ),
          Padding(
            padding: EdgeInsets.only(left: w * 0.06, right: w * 0.06, bottom: h * 0.04),
            child: Column(
              children: [
               
                SizedBox(
                  width: w * 0.9,
                  height: h * 0.06,
                  child: CustomOutlineButton(
                    buttonText: "Need Help?",
                    onPressed: () {
                      print("Need Help button clicked");
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
