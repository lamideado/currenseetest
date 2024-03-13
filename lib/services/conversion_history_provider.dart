import 'package:flutter/cupertino.dart';

import 'conversion_history.dart';

class ConversionHistoryProvider extends ChangeNotifier {
  final List<ConversionHistory> _history = [];

  // Method to add a new conversion to history
  void addToHistory(ConversionHistory conversion) {
    _history.add(conversion);
    notifyListeners(); // Notify listeners about changes in history
  }

  // Method to clear the history
  void clearHistory() {
    _history.clear();
    notifyListeners();
  }

  // Getter to access the history list
  List<ConversionHistory> get history => List.unmodifiable(_history); // Return unmodifiable copy
}