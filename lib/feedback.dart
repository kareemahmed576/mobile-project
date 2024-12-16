import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_shopping/product.dart';

class Feedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('All FeedBack and Rates'),backgroundColor: Colors.lightBlue),
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: FutureBuilder(
            future: FirebaseFirestore.instance.collection('feedback').get(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData == false) {
                return Text('No data');
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index ) {
                      return Container(
                        width: 200,
                        height: 200,
                        child: Column(
                          children: [
                            Text('$snapshot.data.docs[index]["commit"]',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('$snapshot.data.docs[index]["rate"]'+" / 5",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }
}