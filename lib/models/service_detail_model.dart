class ServiceModel {
  final String title;
  final bool available;
  final double price;
  final String imagePath;
  final String description;
  final String deviceName;

  ServiceModel({
    required this.title,
    required this.available,
    required this.price,
    required this.imagePath,
    required this.description,
    required this.deviceName,
  });

  // Convert Firestore JSON to Model
  factory ServiceModel.fromMap(Map<String, dynamic> data) {
    return ServiceModel(
      title: data['title'] ?? '',
      available: data['available'] ?? false,
      price: (data['price'] ?? 0).toDouble(),
      imagePath: data['imagePath'] ?? '',
      description: data['description'] ?? '',
      deviceName: data['deviceName'] ?? '', // Default if missing
    );
  }

  // Convert Model to JSON (if needed for Firestore)
  Map<String, dynamic> toMap() {
    return {
      'name': title,
      'available': available,
      'price': price,
      'imagePath': imagePath,
    };
  }
}
