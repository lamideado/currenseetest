import 'package:currenseetest/services/api_client.dart';
import 'package:currenseetest/services/conversion_history.dart';
import 'package:currenseetest/themes/text.dart';
import 'package:currenseetest/widgets/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:currenseetest/widgets/navbar.dart';
import 'package:currenseetest/themes/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:currenseetest/history_page.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Instance of the history class
  final List<ConversionHistory> history = []; // Initialize empty history list

  // Instance of the API client
  ApiClient client = ApiClient();

  // Setting the colors
  Color mainColor = AppColors.bgColor;
  Color secondColor = AppColors.black;

  // Setting variables
  late List<String> currencies;
  late String from;
  late String to;

  late double rate;
  String result = "";

  @override
  void initState() {
    super.initState();
    (() async {
      final prefs = await SharedPreferences.getInstance();
      final String? encodedHistory = prefs.getString('conversionHistory');
      if (encodedHistory != null) {
        final List<dynamic> decodedHistory = jsonDecode(encodedHistory);
        setState(() {
          history.addAll(decodedHistory.map((h) => ConversionHistory.fromJson(h)).toList());
        });
      }
      List<String> list = await client.getCurrencies();
      double initialRate = await client.getRate(list.first, "USD"); // Assuming initial rate is "USD"
      setState(() {
        currencies = list;
        from = "USD";
        to = list.first;
        result = (initialRate * 1.0).toStringAsFixed(3);
      });
      _loadHistory();
    })();
  }

  Future<void> saveHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedHistory = jsonEncode(history.map((h) => h.toJson()).toList());
    await prefs.setString('conversionHistory', encodedHistory);
  }

  // Method to load history list from SharedPreferences
  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedHistory = prefs.getString('conversionHistory');
    if (encodedHistory != null) {
      final List<dynamic> decodedHistory = jsonDecode(encodedHistory);
      setState(() {
        history.addAll(decodedHistory.map((h) => ConversionHistory.fromJson(h)).toList());
      });
    }
  }


  void addToHistory(String from, String to, double amount, double convertedAmount) {
    setState(() {
      history.add(ConversionHistory(
        fromCurrency: from,
        toCurrency: to,
        amount: amount,
        convertedAmount: convertedAmount,
        timestamp: DateTime.now(),
      ));
      saveHistory();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          title: SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                boldText(text: 'CurrenSee ', size: 20, color: AppColors.primary),
                modifiedText(text: 'Converter', size: 20, color: AppColors.lightwhite)
              ],
            ),
          ),
          backgroundColor: mainColor,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextField(
                            onSubmitted: (value) async {
                              try {
                                rate = await client.getRate(from, to);
                                setState(() {
                                  result = (rate * double.parse(value)).toStringAsFixed(3);
                                  addToHistory(from, to, double.parse(value), rate * double.parse(value));
                                });
                              } catch (error) {
                                // Handle errors (e.g., show a snackbar or dialog)
                                print("Error fetching rate: $error");
                              }
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.darkgrey),
                              ),
                              filled: true,
                              fillColor: AppColors.darkgrey,
                              labelText: "Input value to convert",
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18.0,
                              ),
                            ),
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                              height: 20.0
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Wrap customDropDown with SizedBox for width constraint
                              SizedBox(
                                width: 120.0,
                                child: customDropDown(currencies, from, (val) => setState(() {
                                  from = val; // Update the "from" currency state
                                })),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  String temp = from;
                                  setState(() {
                                    from = to;
                                    to = temp;
                                  });
                                },
                                elevation: 0.0,
                                backgroundColor: AppColors.primary,
                                child: const Icon(Icons.swap_horiz),
                              ),
                              SizedBox(
                                width: 120.0,
                                child: customDropDown(currencies, to, (val) => setState(() {
                                  to = val; // Update the "from" currency state
                                })),
                              ),
                            ],
                          ),
                          SizedBox(height: 40.0),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                                color: AppColors.darkgrey,
                                borderRadius: BorderRadius.circular(15.0)
                            ),
                            child: Column(
                              children: [
                                Text("Result", style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                )),
                                Text(result, style: TextStyle(
                                  color: AppColors.lightwhite,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                )),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // **Pass history list to HistoryPage**
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoryPage(history: history),
                    ),
                  ),
                  child: Text(
                    'View Conversion History',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

