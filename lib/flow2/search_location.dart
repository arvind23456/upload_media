import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Searchlocation extends StatefulWidget {
  const Searchlocation({super.key});

  @override
  State<Searchlocation> createState() => _SearchlocationState();
}

class _SearchlocationState extends State<Searchlocation> {
  var arrNames = [
    'Swami automobiles',
    'RSA Motors',
    'HDFC Bank ATM',
    'Swiss Pie',
    'Hometel',
    'Amirtsar',
    'Sun Pharma',
    'SBI Bank',
    'Axis Bank',
    'Sector 17',
    'Jammu',
    'Ladakh',
  ];

  var filterList = [];

  void SearchFilter(String value) {
    setState(() {
      filterList = arrNames
          .where(
              (element) => element.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            )),
        title: const Text('Search location'),
        titleSpacing: 0.2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, bottom: 12, top: 15),
              child: Container(
                height: 45,
                child: TextField(
                  onTap: () {
                    print("{$arrNames}");
                  },
                  onChanged: (value) {
                    SearchFilter(value);
                  },
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Search location',
                      hintStyle: const TextStyle(
                          color: Color.fromRGBO(110, 111, 116, 1)),
                      contentPadding: const EdgeInsets.all(8),
                      fillColor: const Color.fromRGBO(248, 248, 251, 1),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(229, 229, 229, 1)),
                          borderRadius: BorderRadius.circular(14)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(229, 229, 229, 1)),
                      ),
                      suffixIcon: const Icon(
                        Icons.search,
                        size: 32,
                        color: Colors.black45,
                      )),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: filterList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.pop(context, filterList[index]);
                  },
                  title: Text(
                    filterList[index],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: const Padding(
                    padding: EdgeInsets.only(left: 05),
                    child: Text('Chandigarh'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
