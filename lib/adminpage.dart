import 'package:flutter/material.dart';
import 'package:online_shopping/manage_product.dart';
import 'package:online_shopping/variables.dart';

import 'manage_category.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Center(
          child: Text(
            'HomePage',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              savePref(false, '', '');
              Navigator.of(context).pop(null);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 200,
                  height: 50,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      "Add/Edit/Remove Category",
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ManageCategory()));
              },
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 200,
                  height: 50,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      "Add/Edit/Remove Product",
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ManageProduct()));
              },
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 200,
                  height: 50,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      "Report About Transactions",
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              onTap: () {

              },
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 200,
                  height: 50,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      "FeedBack and Rate",
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              onTap: () {

              },
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 200,
                  height: 50,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      "Best Selling Chart",
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              onTap: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}
