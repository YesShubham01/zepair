class Address {
  final String type;
  final String address;
  final String name;
  final String phoneNumber;

  Address({
    required this.type,
    required this.address,
    required this.name,
    required this.phoneNumber,
  });
}

final List<Address> dummyAddresses = [
  Address(
    type: 'Home',
    address: '101, Pocket 25, Subhash Park, Rohini, Delhi, 110034, India',
    name: 'Shubham',
    phoneNumber: '+91 1234567898',
  ),
  Address(
    type: 'Other',
    address: '101, Pocket 25, Subhash Park, Rohini, Delhi, 110034, India',
    name: 'Nikhil',
    phoneNumber: '+91 1234567898',
  ),
];
