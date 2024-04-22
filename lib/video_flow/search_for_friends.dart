// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Searchforfriends extends StatefulWidget {
  const Searchforfriends({super.key});

  @override
  State<Searchforfriends> createState() => _SearchforfriendsState();
}

class _SearchforfriendsState extends State<Searchforfriends> {
  var arrNames = [
    'FlorianTales',
    'Graver_Merchant',
    'Jacob Hillßpike',
    'KapturetheLight',
    'Olivi0Smith',
    "Gracia B.",
    'Mason 3illiam',
    'Evelyn_erchanr',
    'Liam23Jones'
  ];

  TextEditingController searchController = TextEditingController();

  bool isSearching = false;

  var filterList = [];

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        if (searchController.text.isNotEmpty) {
          isSearching = true;
        }
      });
    });
  }

  void searchFilter(String value) {
    setState(() {
      filterList = arrNames
          .where(
              (element) => element.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void showToast() {
    Fluttertoast.showToast(msg: "User already selected");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text('Search for Friends'),
        titleSpacing: 0.2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 12, left: 12, right: 12, bottom: 12),
              child: SizedBox(
                height: 45,
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    searchFilter(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search for user',
                    suffixIcon: Image.asset('assets/images/Vector (10).png'),
                    contentPadding: EdgeInsets.all(9),
                    filled: true,
                    fillColor: Color.fromRGBO(248, 248, 251, 1),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(229, 229, 229, 1))),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(229, 229, 229, 1)),
                    ),
                  ),
                ),
              ),
            ),
            if (filterList.isEmpty && isSearching)
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 250),
                  child: Text(
                    'User not found',
                    style: TextStyle(color: Colors.black54, fontSize: 27),
                  ),
                ),
              )
            else
              SafeArea(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: filterList.length,
                  itemBuilder: (context, index) {
                    final verifiedNames = [
                      'Graver_Merchant',
                      'KapturetheLight',
                      'Olivi0Smith',
                      'Mason 3illiam',
                      'Evelyn_erchanr',
                    ];
                    final bool isVerified =
                        verifiedNames.contains(arrNames[index]);

                    //    final option = filterList[index];

                    return ListTile(
                      onTap: () {
                        Navigator.pop(context, filterList[index]);
                      },
                      contentPadding: EdgeInsets.all(9),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://randomuser.me/api/portraits/men/$index.jpg'),
                        radius: 35,
                      ),
                      title: Row(
                        children: [
                          Text(filterList[index]),
                          if (isVerified)
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.verified,
                                color: Colors.blue,
                                size: 15,
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
