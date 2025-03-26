import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:zepair/backend/authentication_backend.dart';
import 'package:zepair/backend/user_detail_backend_service.dart';
import 'package:zepair/models/user_detail_model.dart';
import 'package:zepair/modules/Add%20New%20Address%20Page/support_widget/custom_loaction.dart';
import 'package:zepair/provider/user_datails_provider.dart';
import 'package:zepair/utils/custom%20widgets/custom_button.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';
import '../../utils/custom widgets/custom_appbar.dart';
import 'support_widget/custom_save_button.dart';
import 'support_widget/custom_text_field.dart';

class AddNewAddressPage extends StatefulWidget {
  final AddressModel? address; // Nullable, used when editing
  final bool addBackButton;

  const AddNewAddressPage({super.key, this.address, this.addBackButton = true});

  @override
  _AddNewAddressPageState createState() => _AddNewAddressPageState();
}

class _AddNewAddressPageState extends State<AddNewAddressPage> {
  late TextEditingController _streetController;
  late TextEditingController _apartmentController;
  late TextEditingController _cityStateController;
  late TextEditingController _zipCodeController;
  late TextEditingController _landmarkController;

  late String _selectedType;
  double? _latitude;
  double? _longitude;
  bool _isLoading = false;
  late String _userName; // Temporary test user
  late String _userPhone; // Temporary test phone

  // ✅ initializing function
  @override
  void initState() {
    super.initState();

    _userName = widget.address?.name ??
        context.read<UserDetailsProvider>().userDetail.name ??
        "nameNotFound";
    _userPhone = widget.address?.phone ??
        context.read<UserDetailsProvider>().userDetail.phone ??
        "phoneNotFound";

    // Pre-fill data if editing an existing address
    _streetController = TextEditingController(
        text: widget.address?.address.split(", ")[0] ?? "");
    _apartmentController = TextEditingController(
        text: widget.address?.address.split(", ")[1] ?? "");
    _cityStateController = TextEditingController(
        text: widget.address?.address.split(", ")[2] ?? "");
    _zipCodeController = TextEditingController(
        text: widget.address?.address.split(", ")[3] ?? "");
    _landmarkController = TextEditingController(
        text: widget.address?.address.split(", ")[4] ?? "");

    _selectedType = widget.address?.type ?? "Home"; // Default to Home if new
    _latitude = widget.address?.coordinates["latitude"];
    _longitude = widget.address?.coordinates["longitude"];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double w = size.width;
    double h = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Enter complete address",
        applyBackButton: widget.addBackButton,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.009),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Info Section
              CustomCardWidget(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.03, vertical: h * 0.015),
                  child: Row(
                    children: [
                      const Icon(Icons.phone, color: Colors.black, size: 18),
                      SizedBox(width: w * 0.02),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: CustomText(
                                text: "$_userName, ",
                                fontFamily: FontType.balooBhai2,
                                color: Colors.black,
                                size: 16,
                              ),
                            ),
                            Expanded(
                              child: CustomText(
                                text: _userPhone,
                                fontFamily: FontType.balooBhai2,
                                size: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: _editNameAndPhone,
                        child: const Icon(Icons.edit, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: h * 0.02),

              // Address Input Fields (Now Pre-Filled)
              CustomTextField(
                  controller: _streetController, hintText: "Street Address *"),
              CustomTextField(
                  controller: _apartmentController,
                  hintText: "Apartment / floor (optional)"),
              CustomTextField(
                  controller: _cityStateController, hintText: "City, State *"),
              CustomTextField(
                  controller: _zipCodeController, hintText: "Zip Code *"),
              CustomTextField(
                  controller: _landmarkController,
                  hintText: "Nearby landmark (optional)"),

              Gap(h * 0.02),

              // GPS Button
              GetLocationButton(onLocationFetched: _updateLocation),

              if (_latitude != null && _longitude != null)
                Padding(
                  padding: EdgeInsets.only(top: h * 0.02),
                  child: CustomText(
                      text: "Location: ($_latitude, $_longitude)",
                      fontFamily: FontType.sfPro,
                      size: 16,
                      color: Colors.black),
                ),

              Gap(h * 0.02),

              // Save As Section (No Changes)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SaveAsButton(
                    icon: Icons.home,
                    label: "Home",
                    selected: _selectedType == "Home",
                    onTap: () => setState(() => _selectedType = "Home"),
                  ),
                  SaveAsButton(
                    icon: Icons.work,
                    label: "Work",
                    selected: _selectedType == "Work",
                    onTap: () => setState(() => _selectedType = "Work"),
                  ),
                  SaveAsButton(
                    icon: Icons.location_on,
                    label: "Other",
                    selected: _selectedType == "Other",
                    onTap: () => setState(() => _selectedType = "Other"),
                  ),
                ],
              ),

              Gap(h * 0.09),

              // Confirm Button
              _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 234, 190, 17)),
                    )
                  : CustomButton(
                      text: "Add Address",
                      onPressed: _saveAddress,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ function for updating location
  void _updateLocation(double lat, double lon) {
    setState(() {
      _latitude = lat;
      _longitude = lon;
    });
  }

  // ✅ function for saving and updating address
  Future<void> _saveAddress() async {
    if (_streetController.text.isEmpty ||
        _cityStateController.text.isEmpty ||
        _zipCodeController.text.isEmpty ||
        _latitude == null ||
        _longitude == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text("Please fill all required fields and fetch location")),
      );
      return;
    }

    setState(() {
      _isLoading = true; // Show loader
    });

    String fullAddress =
        "${_streetController.text}, ${_apartmentController.text}, ${_cityStateController.text}, ${_zipCodeController.text}, ${_landmarkController.text}";

    bool success;

    String? userUid = context.read<UserDetailsProvider>().userDetail.uid;

    if (userUid == null) {
      success = false;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("❌ User not logged In")));
    } else {
      if (widget.address != null) {
        // Update existing address
        success = await UserService().updateUserAddress(
          uid: userUid, // Replace with actual user ID
          oldAddress: widget.address!.address, // Identify the old address
          name: _userName,
          phone: _userPhone,
          newAddress: fullAddress,
          coordinates: {"latitude": _latitude!, "longitude": _longitude!},
          type: _selectedType,
        );
      } else {
        // Add new address
        success = await UserService().addUserAddress(
          uid: userUid,
          name: _userName,
          phone: _userPhone,
          address: fullAddress,
          coordinates: {"latitude": _latitude!, "longitude": _longitude!},
          type: _selectedType,
        );
      }
    }

    setState(() {
      _isLoading = false; // Hide loader
    });

    if (success) {
      await context.read<UserDetailsProvider>().setUserDetails();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(widget.address != null
                ? "✅ Address updated successfully!"
                : "✅ Address added successfully!")),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("❌ Failed to save address. Try again!")),
      );
    }
  }

  // ✅ name and phone edit card
  void _editNameAndPhone() {
    TextEditingController nameController =
        TextEditingController(text: _userName);
    TextEditingController phoneController =
        TextEditingController(text: _userPhone);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: "Name")),
              const Gap(10),
              TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: "Phone"),
                  keyboardType: TextInputType.phone),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel")),
            TextButton(
                onPressed: () {
                  setState(() {
                    _userName = nameController.text;
                    _userPhone = phoneController.text;
                  });
                  Navigator.pop(context);
                },
                child: const Text("Save")),
          ],
        );
      },
    );
  }
}
