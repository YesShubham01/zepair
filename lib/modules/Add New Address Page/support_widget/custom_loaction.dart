import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zepair/backend/location_service.dart';

class GetLocationButton extends StatefulWidget {
  final Function(double, double) onLocationFetched;

  const GetLocationButton({Key? key, required this.onLocationFetched})
      : super(key: key);

  @override
  _GetLocationButtonState createState() => _GetLocationButtonState();
}

class _GetLocationButtonState extends State<GetLocationButton> {
  bool _isFetchingLocation = false;

  Future<void> _fetchLocation() async {
    setState(() {
      _isFetchingLocation = true;
    });

    Position? position = await LocationService().getCurrentLocation();

    if (position != null) {
      widget.onLocationFetched(position.latitude, position.longitude);
    }

    setState(() {
      _isFetchingLocation = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.of(context).size;
    double w = dimensions.width;
    double h = dimensions.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.006),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        ),
        onPressed: _fetchLocation,
        icon: const Icon(Icons.my_location, color: Colors.white),
        label: _isFetchingLocation
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : const Text(
                "Get Current Location",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
      ),
    );
  }
}
