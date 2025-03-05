import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/faq_model.dart';

class FAQService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch FAQs from Firestore and convert them into a list of FAQ objects
  Future<List<FAQ>> fetchFAQs() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('App').doc('FAQ').get();

      if (!doc.exists) {
        return [];
      }

      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

      if (data == null || data.isEmpty) {
        return [];
      }

      // Convert Firestore map fields into FAQ objects
      List<FAQ> faqs = data.entries.map((entry) {
        if (entry.value is Map<String, dynamic>) {
          return FAQ.fromMap(entry.key, entry.value);
        }
        return FAQ(id: entry.key, question: entry.key, answer: 'No Answer Available');
      }).toList();

      return faqs;
    } catch (e) {
      print("Error fetching FAQs: $e");
      return [];
    }
  }
}

