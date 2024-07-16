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
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/trackorder');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[600],
                  foregroundColor: Colors.grey[200]
              ),
              child:  const Row(
                children: <Widget>[
                  Icon(Icons.fire_truck),
                  SizedBox(width: 80,),
                  Text(
                    'Track my order',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}