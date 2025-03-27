import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetailModel {
  String? uid;
  String? name;
  String? phone;
  List<String>? bookings;
  List<AddressModel>? addresses;
  List<String>? warranties;
  int? selectedAddressIndex; // ✅ Added field to store selected address index

  UserDetailModel({
    this.uid,
    this.name,
    this.phone,
    this.bookings,
    this.addresses,
    this.warranties,
    this.selectedAddressIndex, // ✅ Include in constructor
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
        selectedAddressIndex:
            data['selectedAddressIndex'] ?? 0, // ✅ Default to 0 if missing
      );
      return user;
    } catch (e) {
      print("❌ Error parsing UserDetailModel: $e");
      return UserDetailModel(
        uid: doc.id,
        name: 'Error',
        phone: '',
        bookings: [],
        addresses: [],
        warranties: [],
        selectedAddressIndex: 0, // ✅ Safe fallback
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
        "latitude": (map['coordinates']['latitude'] as num).toDouble(),
        "longitude": (map['coordinates']['longitude'] as num).toDouble()
      },
      type: map['type'] ?? '',
    );
  }
}
