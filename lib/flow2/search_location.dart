import 'package:flutter/material.dart';

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

  bool isSearching = false;

  TextEditingController searchcontroller = TextEditingController();

  @override
  void initState() {
    searchcontroller.addListener(() {
      setState(() {
        if (searchcontroller.text.isNotEmpty) {
          isSearching = true;
        }
      });
    });
  }

  void searchfilter(String value) {
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
        title: const Text('Search for location'),
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
                  controller: searchcontroller,
                  onChanged: (value) {
                    searchfilter(value);
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Search for location',
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
                    suffixIcon: Image.asset('assets/images/Vector (10).png'),
                  ),
                ),
              ),
            ),
            if (filterList.isEmpty && isSearching)
              const Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Text(
                    'Location Not Found',
                    style: TextStyle(color: Colors.black54, fontSize: 27),
                  ),
                ),
              )
            else
              Container(
                child: SafeArea(
                  top: true,
                  bottom: true,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filterList.length,
                    physics: ScrollPhysics(),
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
                ),
              ),
          ],
        ),
      ),
    );
  }
}




/*
 Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filterlist.length,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          filterlist[index],
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      );
                    }),
              ),  */