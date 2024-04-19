import 'dart:math';

import 'package:flutter/material.dart';
import 'package:professional_fee_calculator/logic.dart';
import 'package:professional_fee_calculator/model/professional.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Professional Fee Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var includeReinburstment = true;
  var fee = 0.0;
  var currency = "N";
  late TextEditingController sumController;

  bool includeVat = true;
  @override
  void initState() {
    super.initState();
    sumController = TextEditingController();
  }

  @override
  void dispose() {
    sumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Enter Sum: "),
                    Expanded(
                      child: TextField(
                        controller: sumController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          var val = double.tryParse(value);
                          if (val is num) {
                            var r = calculateProjectProfessionalFee(
                                double.parse(value), professionals,
                                includeReinburstMent: includeReinburstment);
                            fee = double.parse(r);
                            setState(() {});
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Include Reinburstment: "),
                    Switch(
                        value: includeReinburstment,
                        onChanged: (value) {
                          var val = double.tryParse(sumController.text);
                          var r = calculateProjectProfessionalFee(
                              val ?? 0, professionals,
                              includeReinburstMent: value);
                          fee = double.parse(r);
                          setState(() {
                            includeReinburstment = value;
                          });
                        }),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Include VAT: "),
                    Switch(
                        value: includeVat,
                        onChanged: (value) {
                          var val = double.tryParse(sumController.text);
                          var r = calculateProjectProfessionalFee(
                              val ?? 0, professionals,
                              includeReinburstMent: includeReinburstment,
                              includeVat: value);
                          fee = double.parse(r);
                          setState(() {
                            includeVat = value;
                          });
                        }),
                  ],
                ),
                Text("Professional Fee: $currency $fee"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
