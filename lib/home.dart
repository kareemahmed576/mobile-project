import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping/variables.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Center(
          child: Text(
            'HomePage',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: Text("Home"),
      )
    );
  }
}