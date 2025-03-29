import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/backend/appointment_service.dart';
import 'package:zepair/models/appointment_model.dart';
import 'package:zepair/modules/Booking%20Page/Support%20Widget/booking_card.dart';
import 'package:zepair/utils/custom%20widgets/custom_appbar.dart';
import 'package:zepair/utils/custom%20widgets/custom_loading_screen.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_button.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';
import 'package:zepair/utils/custom%20widgets/serviceEnum.dart';
import '../../utils/custom widgets/custom_title.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late double h;
  late double w;
  late Stream<List<Appointment>> _appointmentStream;

  @override
  void initState() {
    super.initState();
    _appointmentStream = AppointmentService().getUserAppointments();
  }

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.of(context).size;
    w = dimensions.width;
    h = dimensions.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: "Bookings"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTitle(text: "Active Bookings"),
            Gap(h * 0.006),
            Expanded(
              child: StreamBuilder<List<Appointment>>(
                stream: _appointmentStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CustomLoadingScreen(); // Show loader while waiting
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No bookings available."));
                  }

                  List<Appointment> serviceList = snapshot.data!;
                  print("Booking fetched.");
                  print(serviceList.length);
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: serviceList.length,
                    separatorBuilder: (context, index) => const Gap(0),
                    itemBuilder: (context, index) {
                      var service = serviceList[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: h * 0.006),
                        child: BookingCard(
                          imagePath: service.imagePath,
                          title: service.title,
                          amountPaid: service.amountPaid,
                          description: service.description,
                          status: service.status,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: h * 0.006),
              child: CustomOutlineButton(
                height: h * 0.06,
                width: w * 0.9,
                buttonText: "Need Help?",
                onPressed: () {
                  print("Need Help button clicked");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
