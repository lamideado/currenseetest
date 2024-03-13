import 'package:flutter/material.dart';
import 'package:currenseetest/services/conversion_history.dart';
import 'widgets/navbar.dart';

class HistoryPage extends StatelessWidget {
  final List<ConversionHistory> history;

  const HistoryPage({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Conversion History'),
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          final conversion = history[index];
          return ListTile(
            title: Text(
              '${conversion.fromCurrency} -> ${conversion.toCurrency}',
            ),
            subtitle: Text(
              '${double.parse(conversion.amount.toStringAsFixed(2))} ${conversion.fromCurrency} = ${double.parse(conversion.convertedAmount.toStringAsFixed(2))} ${conversion.toCurrency}',
            ),
            trailing: Text(
              conversion.timestamp.toString(),
              style: const TextStyle(fontSize: 12.0),
            ),
          );
        },
      ),
    );
  }
}