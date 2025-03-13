import 'package:cloud_firestore/cloud_firestore.dart';
import 'warranty_model.dart';

class WarrantyModel {
  final String warrantyId;
  final String appointmentId;
  final String serviceTitle;
  final Timestamp startDate;
  final Timestamp endDate;
  final String imagePath;

  WarrantyModel({
    required this.warrantyId,
    required this.appointmentId,
    required this.serviceTitle,
    required this.startDate,
    required this.endDate,
    required this.imagePath,
  });

  factory WarrantyModel.fromMap(String id, Map<String, dynamic> data) {
    return WarrantyModel(
      warrantyId: id,
      appointmentId: data['appointmentId'] ?? '',
      serviceTitle: data['serviceTitle'] ?? '',
      startDate: data['startDate'] ?? Timestamp.now(),
      endDate: data['endDate'] ?? Timestamp.now(),
      imagePath: data['imagePath'] ?? '',
    );
  }
}
