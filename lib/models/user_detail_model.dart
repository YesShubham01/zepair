class UserDetailModel {
  String? name;
  String? phone;
  String? uid;
  List<String>? address;
  List<String>? appointment;

  UserDetailModel({
    this.name,
    this.phone,
    this.uid,
    this.address,
    this.appointment,
  });

  // Convert JSON to Object
  factory UserDetailModel.fromJson(Map<String, dynamic> json) {
    return UserDetailModel(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      uid: json['uid'] as String?,
      address:
          (json['address'] as List<dynamic>?)?.map((e) => e as String).toList(),
      appointment: (json['appointment'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }

  // Convert Object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'uid': uid,
      'address': address,
      'appointment': appointment,
    };
  }
}
