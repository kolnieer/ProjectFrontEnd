import 'package:flutter/material.dart';
import 'package:bigbrewteatech/services/product.dart';
import 'package:bigbrewteatech/services/menuCard.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List products = <Product>[
    Product(productName: "WinterMelon", price: 39.99),
    Product(productName: "Okinawa", price: 29.99),
    Product(productName: "Green Apple", price: 39.99),
    Product(productName: "Coffee", price: 29.99),
    Product(productName: "Blueberry", price: 39.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[400],
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: products.map((product) =>
              Menucard(product: product)).toList(),
        ),
      ),
    );
  }
}