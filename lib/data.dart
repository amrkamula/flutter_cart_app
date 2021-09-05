import 'package:flutter/material.dart';

class Product{
  String? name;
  double price;
  Color? color;
  Product({this.name,this.price=0,this.color});
}

class Data {
  static List<Product> allProducts =[
    Product(
      name: 'Code Smell',
      price: 50.0,
      color: Colors.deepOrange,
    ),
    Product(
      name: 'Control Flow',
      price: 40.0,
      color: Colors.pink,
    ),
    Product(
      name: 'Interpreter',
      price: 80.0,
      color: Colors.purple,
    ),
    Product(
      name: 'Recursion',
      price: 70.0,
      color: Colors.deepPurple,
    ),
    Product(
      name: 'Sprint',
      price: 60.0,
      color: Colors.indigo,
    ),
    Product(
      name: 'Heisenbug',
      price: 40.0,
      color: Colors.blue,
    ),
    Product(
      name: 'Spaghetti',
      price: 80.0,
      color: Colors.lightBlue,
    ),
    Product(
      name: 'Code Smell',
      price: 50.0,
      color: Colors.deepOrange,
    ),
    Product(
      name: 'HydraCode',
      price: 100.0,
      color: Colors.teal,
    ),
    Product(
      name: 'Off-By-One',
      price: 120.0,
      color: Colors.green,
    ),
    Product(
      name: 'Scope',
      price: 30.0,
      color: Colors.lightGreen,
    ),
    Product(
      name: 'Callback',
      price: 50.0,
      color: Colors.lime,
    ),
    Product(
      name: 'Code',
      price: 50.0,
      color: Colors.redAccent,
    ),
    Product(
      name: 'Kamula',
      price: 70.0,
      color: Colors.red,
    ),
    Product(
      name: 'Yaseen',
      price: 130.0,
      color: Colors.deepOrangeAccent,
    ),
    Product(
      name: 'Little mi',
      price: 50.0,
      color: Colors.purpleAccent,
    ),
    Product(
      name: 'Code Smell',
      price: 50.0,
      color: Colors.deepOrange,
    ),
  ];
  static List<int> boughtProductsIndicies =[];
}