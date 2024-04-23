import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterApp());
}

class FlutterApp extends StatelessWidget {
  const FlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FlutterApp",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const SearchLocation(),
    );
  }
}

class SearchLocation extends StatelessWidget {
  const SearchLocation({super.key});

  @override
  Widget build(BuildContext context) {
    var arrNames = [
      'Swami automobiles',
      'RSA Motors',
      'HDFC Bank ATM',
      'Swiss Pie ',
      'Hometel',
    ];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_outlined),
        title: const Text('Search location'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                fillColor: const Color.fromRGBO(248, 248, 251, 1),
                filled: true,
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(arrNames[index % 5],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                    subtitle: const Text('Chandigarh'),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
