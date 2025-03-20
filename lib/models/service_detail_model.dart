class ServiceModel {
  final String title;
  final bool available;
  final double price;
  final String imagePath;
  final String description;
  final List<Map<String, dynamic>> mainServices;
  final List<Map<String, dynamic>> otherServices;

  ServiceModel({
    required this.title,
    required this.available,
    required this.price,
    required this.imagePath,
    required this.description,
    required this.mainServices,
    required this.otherServices
  });

  // Convert Firestore JSON to Model
  factory ServiceModel.fromMap(Map<String, dynamic> data) {
    return ServiceModel(
      title: data['title'] ?? '',
      available: data['available'] ?? false,
      price: (data['price'] ?? 0).toDouble(),
      imagePath: data['imagePath'] ?? '',
      description: data['description'] ?? '', // Default if missing
      mainServices: data?["Main_Services"] != null
          ? List<Map<String, dynamic>>.from(data!["Main_Services"])
          : [],
      otherServices: data["otherServices"] != null
          ? List<Map<String, dynamic>>.from(data["otherServices"]) // 🔥 Corrected to store list of maps
          : [],
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
