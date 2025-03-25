import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/backend/appointment_service.dart';
import 'package:zepair/models/appointment_model.dart';

import 'package:zepair/modules/Booking%20Page/Support%20Widget/booking_card.dart';
import 'package:zepair/utils/custom%20widgets/custom_appbar.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_button.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';
import 'package:zepair/utils/custom%20widgets/serviceEnum.dart';

import '../../utils/custom widgets/custom_title.dart';

class SchedulePage extends StatefulWidget {
  final String? uid; // Nullable user ID

  const SchedulePage({super.key, this.uid});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late double h;
  late double w;
  final AppointmentService _appointmentService =
      AppointmentService(); // Instance of service

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.of(context).size;
    w = dimensions.width;
    h = dimensions.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: "Bookings"),
      body: Padding(
        padding: EdgeInsets.fromLTRB(w * 0.05, h * 0.01, w * 0.05, h * 0.04),
        child: StreamBuilder<List<Appointment>>(
          stream: _appointmentService
              .fetchAppointments(widget.uid ?? "12345"), // Fetching data
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No bookings available."));
            }

            // List of Appointments
            List<Appointment> serviceList = snapshot.data!;

            return Column(
              children: [
                CustomTitle(text: "Available Warranty"),
                Gap(h * 0.006),
                Expanded(
                  child: ListView.separated(
                    itemCount: serviceList.length,
                    separatorBuilder: (context, index) => const Gap(0),
                    itemBuilder: (context, index) {
                      var service = serviceList[index];
                      return TweenAnimationBuilder(
                        duration: Duration(
                            milliseconds: 300 +
                                (index * 100)), // Delayed animation per item
                        tween: Tween<double>(begin: 0, end: 1),
                        curve: Curves.easeOut, // Smooth animation
                        builder: (context, double value, child) {
                          return Opacity(
                            opacity: value,
                            child: Transform.scale(
                              scale: value,
                              child: child,
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: h * 0.006),
                          child: BookingCard(
                            imagePath: service.imagePath,
                            title: service.title,
                            amountPaid: service.amountPaid,
                            description: service.description,
                            status: service.status,
                          ),
                        ),
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
            );
          },
        ),
      ),
    );
  }
}
