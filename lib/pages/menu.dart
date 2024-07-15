import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:bigbrewteatech/services/product.dart';
import 'package:bigbrewteatech/services/menuCard.dart';
import 'package:http/http.dart' as http;

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future<List<dynamic>> products;
  Future<List<dynamic>> fetchData()async{
    final response = await http.get(
        Uri.parse('http://10.0.2.2:8080/products')
    );
    final data = jsonDecode(response.body);
    List products = <Product>[];
    for(var product in data){
      products.add(Product.fromJson(product));
    }
    return products;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    products = fetchData();
  }

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
    );
  }
}