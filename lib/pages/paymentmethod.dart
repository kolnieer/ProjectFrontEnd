import 'package:flutter/material.dart';

class paymentmethod extends StatefulWidget {
  const paymentmethod({super.key});

  @override
  State<paymentmethod> createState() => _paymentmethodState();
}

class _paymentmethodState extends State<paymentmethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        title: Text('Payment Method'),
    backgroundColor: Colors.orange[400],
    centerTitle: true,
        ),
    );
  }
}
