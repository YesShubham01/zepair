class ServiceModel {
  final String title;
  final bool available;
  final double price;
  final String imagePath;
  final String description;
  final List<Map<String, dynamic>> mainServices;
  final Map<String, List<Map<String, dynamic>>>
      otherServices; // 🔥 Updated to store a map of service categories

  ServiceModel({
    required this.title,
    required this.available,
    required this.price,
    required this.imagePath,
    required this.description,
    required this.mainServices,
    required this.otherServices,
  });

  // Convert Firestore JSON to Model
  factory ServiceModel.fromMap(Map<String, dynamic> data) {
    return ServiceModel(
      title: data['title'] ?? '',
      available: data['available'] ?? false,
      price: (data['price'] ?? 0).toDouble(),
      imagePath: data['imagePath'] ?? '',
      description: data['description'] ?? '',
      mainServices: data["Main_Services"] != null
          ? List<Map<String, dynamic>>.from(data["Main_Services"])
          : [],
      otherServices: data["Other_Services"] != null
          ? (data["Other_Services"] as Map<String, dynamic>).map(
              (key, value) => MapEntry(
                key,
                List<Map<String, dynamic>>.from(value),
              ),
            )
          : {},
    );
  }

  // Convert Model to JSON (if needed for Firestore)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'available': available,
      'price': price,
      'imagePath': imagePath,
      'description': description,
      'Main_Services': mainServices,
      'Other_Services': otherServices.map((key, value) => MapEntry(key, value)),
    };
  }
}
