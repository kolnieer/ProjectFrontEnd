import 'dart:convert';

import 'package:bigbrewteatech/pages/selectedproduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/product.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future<List<dynamic>> products;
  Future<List<dynamic>> fetchData()async{
    final response = await http.get(
        Uri.parse('http://10.0.2.2:8080/api/v1/Product/all')
    );
    final data = jsonDecode(response.body);
    print(data);
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: FutureBuilder(
          future: products,
          builder: (context, snapshots){
            if(snapshots.connectionState == ConnectionState.waiting){
              return Center(
                child: SpinKitFadingCircle(
                  color: Colors.orange[400],
                  size: 60.0,
                ),
              );
            }
            if(snapshots.hasData){
              List products = snapshots.data!;
              return Padding(
                padding: EdgeInsets.all(3.0),
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(products[index].productName),
                            Text(
                              products[index].price.toString(),
                              style: TextStyle(
                                  color: Colors.brown[100],
                                  fontSize: 15.0
                              ),
                            ),
                          ],
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(products[index].url),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => selectedProduct(product: products[index]),
                              )
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            }
            return Center(
              child: Text('Unable to load data'),
            );
          },
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
        currentIndex: 0,
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