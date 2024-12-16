import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_shopping/variables.dart';

import 'login.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController usernameTextEdit = new TextEditingController();
  TextEditingController emailTextEdit = new TextEditingController();
  TextEditingController passwordTextEdit = new TextEditingController();

  bool obserText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: Text(
              'Register',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: usernameTextEdit,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: emailTextEdit,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              obscureText: obserText,
              controller: passwordTextEdit,
              decoration: InputDecoration(
                labelText: 'password',
                border: OutlineInputBorder(),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obserText = !obserText;
                    });
                    FocusScope.of(context).unfocus();
                  },
                  child: Icon(
                    obserText == true ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              child: const FittedBox(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 20,
                    ),
                  )),
              //color: Colors.lightBlue,
              onPressed: () {
                const snackBar = SnackBar(
                  content: Text(
                      'Registration Success'),
                  backgroundColor: Colors.green,
                );
                savePref(false,'','');
                FirebaseFirestore.instance.collection('users').add(
                  <String, dynamic>{
                    'username': usernameTextEdit.text,
                    'email': emailTextEdit.text,
                    'password': passwordTextEdit.text,
                    'type':"customer",
                    'id':"0"
                  },
                );
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text('If You Have Already Account ?'),
                SizedBox(
                  width: 7,
                ),
                TextButton(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.lightBlue, fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}