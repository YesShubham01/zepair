import 'package:zepair/utils/constants/image_paths.dart';

enum Device {
  ac,
  refrigerator,
  washingMachine,
  geyser,
  television,
  inverter,
}

extension DeviceExtension on Device {
  String get title {
    switch (this) {
      case Device.ac:
        return "AC Repair & Service";
      case Device.refrigerator:
        return "Refrigerator Repair";
      case Device.washingMachine:
        return "Washing Machine Repair";
      case Device.geyser:
        return "Geyser Repair & Service";
      case Device.television:
        return "Television Repair";
      case Device.inverter:
        return "Inverter Repair & Service";
    }
  }

  String get icon {
    switch (this) {
      case Device.ac:
        return ImagePaths.acIcon;
      case Device.refrigerator:
        return ImagePaths.fridgeIcon;
      case Device.washingMachine:
        return ImagePaths.washingMachineIcon;
      case Device.geyser:
        return ImagePaths.geyserIcon;
      case Device.television:
        return ImagePaths.tvIcon;
      case Device.inverter:
        return ImagePaths.inverterIcon;
    }
  }
}
