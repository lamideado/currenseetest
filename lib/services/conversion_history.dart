class ConversionHistory {
  final String fromCurrency;
  final String toCurrency;
  final double amount;
  final double convertedAmount;
  final DateTime timestamp;

  ConversionHistory({
    required this.fromCurrency,
    required this.toCurrency,
    required this.amount,
    required this.convertedAmount,
    required this.timestamp,
  });

  // Method to convert ConversionHistory object to JSON format
  Map<String, dynamic> toJson() => {
    'fromCurrency': fromCurrency,
    'toCurrency': toCurrency,
    'amount': amount,
    'convertedAmount': convertedAmount,
    'timestamp': timestamp.toString(), // Convert timestamp to string
  };

  // Method to create ConversionHistory object from JSON data
  factory ConversionHistory.fromJson(Map<String, dynamic> json) => ConversionHistory(
    fromCurrency: json['fromCurrency'] as String,
    toCurrency: json['toCurrency'] as String,
    amount: json['amount'] as double,
    convertedAmount: json['convertedAmount'] as double,
    timestamp: DateTime.parse(json['timestamp'] as String),
  );
}

