import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_shopping/Product1.dart';
import 'package:online_shopping/variables.dart';


class Cart extends StatefulWidget {
  Cart();

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  _CartState();

  void calculateTotalPrice()
  {
    for(var item in cart_list) {
      total_price += (item.price - (item.price * (item.discount / 100.0)));
    }
  }

  void add(int index,double price,double discount) {
    setState(() {
      cart_list[index].counter++;
      total_price += (price - (price * (discount / 100.0)));
    });
  }

  void minus(int index ,double price,double discount) {
    setState(() {
      if (cart_list[index].counter != 1)
        cart_list[index].counter--;
      total_price -= (price - (price * (discount / 100.0)));
    });
  }

  @override
  Widget build(BuildContext context) {
    calculateTotalPrice();
    return Scaffold(
      appBar: AppBar(
          title: const Text('cart'), backgroundColor: Colors.lightBlue),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart_list.length,
                itemBuilder: (context, index) {
                  return Expanded(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: cart_list[index].imgage_url,
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                              placeholder: (BuildContext context,
                                  String url) =>
                                  Container(color: Colors.black,),
                              errorWidget: (context, url,
                                  error) => const Icon(Icons.error),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              cart_list[index].name,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              (cart_list[index].price).toString(),
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              (cart_list[index].discount).toString() +
                                  '%',
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              (cart_list[index].price - (cart_list[index]
                                  .price * (cart_list[index].discount /
                                  100.0))).toString(),
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                add(index, cart_list[index].price,
                                    cart_list[index].discount);
                              },
                              child: new Icon(
                                Icons.add, color: Colors.white,),
                              backgroundColor: Colors.green,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('$cart_list[index].counter',
                                style: TextStyle(fontSize: 18.0)),
                            SizedBox(
                              height: 10,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                minus(index, cart_list[index].price,
                                    cart_list[index].discount);
                              },
                              child: new Icon(
                                Icons.minimize, color: Colors.white,),
                              backgroundColor: Colors.red,
                            ),
                          ],
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
  }}