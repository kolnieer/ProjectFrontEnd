import 'package:flutter/material.dart';

class deliveryaddress extends StatefulWidget {
  const deliveryaddress({super.key});

  @override
  State<deliveryaddress> createState() => _deliveryaddressState();
}

class _deliveryaddressState extends State<deliveryaddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        title: Text('Delivery Address'),
    backgroundColor: Colors.orange[400],
    centerTitle: true,
        ),
    );
  }
}
