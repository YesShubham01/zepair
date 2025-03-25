class FAQ {
  final String id; // FAQ_ID (e.g., "FAQ_ID1")
  final String question; // The key inside the map (e.g., "What is Zeepair?")
  final String
      answer; // The value inside the map (e.g., "Zeepair is a repair service app.")

  FAQ({
    required this.id,
    required this.question,
    required this.answer,
  });

  // Factory method to create an FAQ from Firestore data
  factory FAQ.fromMap(String id, Map<String, dynamic> data) {
    return FAQ(
      id: id,
      question: data.keys.first, // First key in the map (actual question)
      answer: data.values.first, // First value in the map (actual answer)
    );
  }
}
