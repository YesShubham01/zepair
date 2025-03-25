import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetailModel {
  String? uid;
  String? name;
  String? phone;
  List<String>? bookings;
  List<AddressModel>? addresses;
  List<String>? warranties;

  UserDetailModel({
    this.uid,
    this.name,
    this.phone,
    this.bookings,
    this.addresses,
    this.warranties,
  });

  factory UserDetailModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};

    try {
      final user = UserDetailModel(
        uid: data['uid'] ?? doc.id,
        name: data['name'] ?? 'Unknown',
        phone: data['phone'] ?? 'No phone',
        bookings: (data['bookings'] as List<dynamic>? ?? [])
            .map((e) => e.toString())
            .toList(),
        addresses: (data['addresses'] as List<dynamic>? ?? [])
            .map((e) => AddressModel.fromMap(e))
            .toList(),
        warranties: (data['warranties'] as List<dynamic>? ?? [])
            .map((e) => e.toString())
            .toList(),
      );
      return user;
    } catch (e) {
      print("❌ Error parsing UserDetailModel: $e");
      return UserDetailModel(
        uid: doc.id,
        name: 'Error',
        phone: '',
        bookings: [], // Return empty list instead of error
        addresses: [],
        warranties: [],
      );
    }
  }
}

// ✅ Address model for better structure
class AddressModel {
  final String name;
  final String phone;
  final String address;
  final Map<String, double> coordinates;
  final String type;

  AddressModel({
    required this.name,
    required this.phone,
    required this.address,
    required this.coordinates,
    required this.type,
  });

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      coordinates: {
        "latitude": (map['coordinates']['latitude'] as num)
            .toDouble(), // ✅ Explicit conversion
        "longitude": (map['coordinates']['longitude'] as num).toDouble()
      },
      type: map['type'] ?? '',
    );
  }
}
