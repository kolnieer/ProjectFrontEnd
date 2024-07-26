import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bigbrewteatech/services/TransactionHistory.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class cart {
  final int cartId;
  final String product;
  final int userId;
  final int quantity;
  final double price;

  cart({
    required this.cartId,
    required this.product,
    required this.userId,
    required this.quantity,
    required this.price,});
}

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  late Future<List<dynamic>> transactions;
  List<bool> showDetails = [];
  Future<List<dynamic>> fetchData() async{
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/api/v1/cart')
    );
    final data = jsonDecode(response.body);
    print(data);
    List transactions = <cart>[];
    for (var transaction in data){
      transactions.add(TransactionHistory.fromJson(transaction));
    }
    return transactions;
  }

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
              fontSize: 20.0,
              color: Colors.black,
            ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/checkout');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[600],
                  foregroundColor: Colors.grey[200]
              ),
              child:  const Row(
                children: <Widget>[
                  Icon(Icons.shopping_bag),
                  SizedBox(width: 80,),
                  Text(
                    'Check out',
                    style: TextStyle(
                      wordSpacing: 5.0,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int val){
          switch(val){
            case 0:
              Navigator.pushNamed(context, '/menu');
              break;
            case 1:
              Navigator.pushNamed(context, '/cart');
              break;
            case 2:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart_sharp),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}