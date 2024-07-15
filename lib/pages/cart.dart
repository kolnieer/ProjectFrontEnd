import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Cart'),
        backgroundColor: Colors.orange[400],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Order summary',
            style: TextStyle(
              color: Colors.black,
            ),
            ),
            SizedBox(height: 20.0,),
            TextField(
              decoration: InputDecoration(
                  label: Text(
                    'Taro with pearl',
                    style: TextStyle(
                        color: Colors.grey[500]
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(),
                      borderSide: BorderSide.none
                  ),
                  filled: true,
                  fillColor: Colors.grey[300]
              ),
            ),

          ],
        ),
      ),
    );
  }
}