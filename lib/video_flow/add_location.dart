// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mango/video_flow/search_location.dart';
import 'package:mango/utils/icons.dart';

class Addlocation extends StatefulWidget {
  const Addlocation({super.key});

  @override
  State<Addlocation> createState() => _AddlocationState();
}

class _AddlocationState extends State<Addlocation> {
  String? selectedCity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(
          width: 1,
          color: Color.fromRGBO(241, 239, 239, 1),
        ),
      )),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 7),
        child: Row(
          children: [
            Logoicon.location,
            TextButton(
              onPressed: () async {
                final city = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Searchlocation(),
                  ),
                );
                setState(() {
                  if (city != null) selectedCity = city;
                });
                print(selectedCity);
              },
              child: Text(
                selectedCity ?? 'Add Location',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: selectedCity == null
                      ? Color.fromRGBO(130, 127, 127, 1)
                      : Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

