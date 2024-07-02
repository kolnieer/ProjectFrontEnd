import 'package:flutter/material.dart';
import 'package:bigbrewteatech/services/product.dart';

class Menucard extends StatelessWidget {
  final Product product;

  Menucard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white12,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              product.productName,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              '${product.price}',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}