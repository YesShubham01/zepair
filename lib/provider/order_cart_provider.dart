import 'package:flutter/material.dart';

class OrderCartProvider extends ChangeNotifier {
  double? _amount;
  String? _title;
  String? _description;

  // Getters
  double? get amount => _amount;
  String? get title => _title;
  String? get description => _description;

  // Setters
  void setDetails(
      {required double amount,
      required String title,
      required String description}) {
    _amount = amount;
    _title = title;
    _description = description;
    notifyListeners();
  }

  void setAmount(double value) {
    _amount = value;
    notifyListeners();
  }

  void setTitle(String value) {
    _title = value;
    notifyListeners();
  }

  void setDescription(String value) {
    _description = value;
    notifyListeners();
  }

  // Reset all values
  void resetCart() {
    _amount = null;
    _title = null;
    _description = null;
    notifyListeners();
  }
}
