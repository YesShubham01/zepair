import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';
import 'package:zepair/utils/custom%20widgets/custom_title.dart';

class ServiceDetailPage extends StatefulWidget {
  final String service;
  final String description;

  const ServiceDetailPage({
    super.key,
    this.service = "AC Service",
    this.description =
        "Get your AC cleaned and serviced to extend its lifespan and reduce power consumption.",
  });

  @override
  _ServiceDetailPageState createState() => _ServiceDetailPageState();
}

class _ServiceDetailPageState extends State<ServiceDetailPage> {
  double price = 450.0;
  late double w;
  late double h;
  static const IconData localOffer =
      IconData(0xe39c, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              color: Colors.grey[400],
            ),
            _serviceDetails(),
            _aboutService(),
            _brandService(),
            _zepairBenefits(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              child: _addAddressButton(),
            ),
            Gap(h * 0.1),
          ],
        ),
      ),
    );
  }

  Widget _serviceDetails() {
    return _buildContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitle(text: widget.service),
          Gap(h * 0.006),
          CustomText(
            text: widget.description,
            size: 18,
            fontFamily: FontType.balooBhai2,
          ),
          Gap(h * 0.008),
          Row(
            children: [
              const Icon(localOffer, color: Colors.green),
              Gap(w * 0.02),
              const CustomText(
                text: "Get quality service at best price in Market.",
                size: 16,
                fontFamily: FontType.sfPro,
                weight: FontWeight.normal,
              ),
            ],
          ),
          Gap(h * 0.008),
          Row(
            children: [
              CustomText(
                text: "₹$price",
                size: 24,
                fontFamily: FontType.sfPro,
                weight: FontWeight.bold,
              ),
              Gap(w * 0.02),
              CustomCardWidget(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: h * 0.008, horizontal: w * 0.03),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.local_offer,
                        color: Colors.orange,
                        size: 24,
                      ),
                      Gap(w * 0.02),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Use ZepairRepair",
                            size: 14,
                            fontFamily: FontType.sfPro,
                            weight: FontWeight.bold,
                          ),
                          CustomText(
                            text: "Get 10% off on first Booking",
                            size: 1,
                            fontFamily: FontType.balooBhai2,
                            weight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          _addAddressButton(),
        ],
      ),
    );
  }

  Widget _aboutService() {
    return _buildContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitle(text: "About the service"),
          Gap(h * 0.006),
          _buildListItem(
              "We will assign a qualified engineer who will reach your doorstep within 24 hours."),
          _buildListItem(
              "The engineer will thoroughly inspect your ${widget.service} for any issues."),
          _buildListItem(
              "Your ${widget.service} will be professionally cleaned and serviced for optimal performance."),
        ],
      ),
    );
  }

  Widget _brandService() {
    return _buildContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitle(text: "We Service all brands"),
          Gap(h * 0.006),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centers items in the row
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: w * 0.001), // Add spacing between items
                      child: CustomCardWidget(
                        child: SizedBox(
                          height: h * 0.07,
                          width: w * 0.24,
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(h * 0.002), // Space between rows
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centers items in the row
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.001),
                      child: CustomCardWidget(
                        child: SizedBox(
                          height: h * 0.07,
                          width: w * 0.24,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _zepairBenefits() {
    return _buildContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitle(text: "Zepair Benefits"),
          Gap(h * 0.006),
          Row(
            children: [
              const Expanded(
                child: CustomCardWidget(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                    child: Column(
                      children: [
                        Icon(
                          Icons
                              .verified_user, // Change this to any recommended icon above
                          size: 30,
                          color: Colors.black,
                        ),
                        SizedBox(height: 5),
                        CustomText(
                          text: '10-day warranty',
                          size: 16,
                          fontFamily: FontType.sfPro,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Gap(w * 0.03),
              const Expanded(
                child: CustomCardWidget(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                    child: Column(
                      children: [
                        Icon(
                          Icons
                              .assignment_turned_in, // Change this to any recommended icon above
                          size: 30,
                          color: Colors.black,
                        ),
                        SizedBox(height: 5),
                        CustomText(
                          text: 'Hassel-free Claim',
                          size: 16,
                          fontFamily: FontType.sfPro,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _addAddressButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(w * 0.01, h * 0.018, 0, 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          side: const BorderSide(color: Colors.black),
          minimumSize: const Size(double.infinity, 50),
        ),
        onPressed: () {},
        child: const CustomText(
          text: "Add address and slot",
          size: 22,
          fontFamily: FontType.sfPro,
          weight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(h * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
      ),
      child: child,
    );
  }

  Widget _buildListItem(String text) {
    return Row(
      children: [
        const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 30,
        ),
        Gap(w * 0.02),
        Expanded(
            child: CustomText(
          text: text,
          size: 16,
          fontFamily: FontType.balooBhai2,
          weight: FontWeight.normal,
        )),
      ],
    );
  }
}
