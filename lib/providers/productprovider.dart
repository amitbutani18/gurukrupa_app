import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gurukrupa/providers/product.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  Map<String, Product> _items = {
    // 'title': Product(
    //   id: DateTime.now().toString(),
    //   title: 'Thernal Gun',
    //   imageUrl: 'https://i.postimg.cc/nrDZP3Tn/download-1.jpg',
    //   price: 19.99,
    // ),
    // 'title1': Product(
    //   id: DateTime.now().toString(),
    //   title: 'Milk',
    //   imageUrl: 'https://i.postimg.cc/NG1zdhk5/unnamed.jpg',
    //   price: 19.99,
    // ),
    // 'title2': Product(
    //   id: DateTime.now().toString(),
    //   title: 'Milk',
    //   imageUrl: 'https://i.postimg.cc/g0CgK4wV/unnamed.png',
    //   price: 19.99,
    // ),
  };

  Map<String, Product> get items {
    return {..._items};
  }

  Future<void> getProduct() async {
    final db = FirebaseDatabase.instance.reference().child("products");
    db.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, values) {
        print(values["title"]);
        _items.putIfAbsent(
            key,
            () => Product(
                id: values["id"],
                title: values["title"],
                imageUrl: values["imageUrl"],
                price: values["price"],
                description: values["description"]));
      });
      notifyListeners();
    });

    // final url = 'https://gurukrupa-472c8.firebaseio.com/products.json';
    // final response = http.get(url).then((value) {
    //   print(json.decode(value.body));
    //   final parsed = json.decode(value.body);
    // });

    // print(json.decode(response.body));
  }

  void addItem(
    String title,
    double price,
    String imageUrl,
    String description,
  ) {
    if (_items.containsKey(title)) {
      print("udate");
      _items.update(
          title,
          (existingCartItem) => Product(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              imageUrl: existingCartItem.imageUrl,
              description: existingCartItem.description));
    } else {
      final url = 'https://gurukrupa-472c8.firebaseio.com/products/$title.json';
      http.put(url,
          body: json.encode({
            'id': DateTime.now().toString(),
            'title': title,
            'price': price,
            'imageUrl': imageUrl,
            'description': description,
          }));
      // _items.putIfAbsent(
      //     title,
      //     () => Product(
      //           id: DateTime.now().toString(),
      //           title: title,
      //           price: price,
      //           imageUrl: imageUrl,
      //         ));
    }
    notifyListeners();
  }
}
