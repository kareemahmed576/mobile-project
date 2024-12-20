import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping/Product1.dart';
import 'package:online_shopping/Profile1.dart';
import 'package:online_shopping/variables.dart';
import 'package:online_shopping/viewallproduct.dart';
import 'package:online_shopping/viewproduct.dart';
import 'cart.dart';

class Home extends StatefulWidget {
  String username;
  String email;
  Home(this.username,this.email);

  @override
  State<Home> createState() => _HomeState(username,email);
}

class _HomeState extends State<Home> {
  TextEditingController serachTextEdit = new TextEditingController();
  String username;
  String email;

  _HomeState(this.username,this.email);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 70,
                  child: Row(
                    children: [
                      Container(
                        width: 15,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.brown,
                        child: Text(username[0].toUpperCase()),
                      ),
                      Container(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 20,
                          ),
                          Text(username,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                TextButton(
                  child: Row(
                    children: [
                      Icon(Icons.account_circle),
                      Container(
                        width: 10,
                      ),
                      Text('Profile'),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Profile1(username, email)));
                  },
                ),
                TextButton(
                  child: Row(
                    children: [
                      Icon(Icons.shopping_cart),
                      Container(
                        width: 10,
                      ),
                      Text('Cart'),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Center(
          child: Text(
            'HomePage',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: (){
              savePref(false,'','');
              Navigator.of(context).pop(null);
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  //height: 150,
                  //width: double.infinity,
                  child: Column(
                    children: [
                      TextField(
                        controller: serachTextEdit,
                        decoration: InputDecoration(
                            prefixIcon: IconButton(
                              onPressed: (){
                                final userRef = FirebaseFirestore.instance.collection('products');
                                userRef.get().then((QuerySnapshot snapshot){
                                  for(int index = 0;index<snapshot.size;index++){
                                    if(snapshot.docs[index]['name']==serachTextEdit.text.trim()){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) =>Viewproduct(
                                          snapshot.docs[index]['imgname'],
                                          snapshot.docs[index]['discount'],
                                          snapshot.docs[index]['price'],
                                          snapshot.docs[index]['category'],
                                          snapshot.docs[index]['name'])));
                                    }
                                  }
                                });
                              },
                              icon: Icon(Icons.search),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            labelText: 'Search'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Best Seller',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),),
                              TextButton(
                                child: Text('See All >>',
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold,color: Colors.lightBlue),),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Viewall()));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}