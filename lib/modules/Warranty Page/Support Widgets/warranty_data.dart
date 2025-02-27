import 'package:zepair/utils/custom%20widgets/serviceEnum.dart';

class Warranty {
  final Device device;
  final String onDate;
  final String validTill;

  Warranty({
    required this.device,
    required this.onDate,
    required this.validTill,
  });
}

final List<Warranty> dummyWarranties = [
  Warranty(
    device: Device.ac,
    onDate: '01-01-2025',
    validTill: '01-01-2026',
  ),
  Warranty(
    device: Device.geyser,
    onDate: '01-01-2025',
    validTill: '01-01-2026',
  ),
];
