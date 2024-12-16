import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_shopping/product.dart';

class Viewall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('All Products'),backgroundColor: Colors.lightBlue),
      backgroundColor: Colors.lightBlue,
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('products').get(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData == false) {
              return Text('No data');
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index ) {
                    return Product(
                        snapshot.data.docs[index]["name"],
                        snapshot.data.docs[index]["imgname"],
                        snapshot.data.docs[index]["category"],
                        snapshot.data.docs[index]["price"],
                        snapshot.data.docs[index]["discount"]);
                  });
            }
          }),
    );
  }
}