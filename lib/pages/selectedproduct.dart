import 'package:flutter/material.dart';
import '../services/product.dart';


class selectedProduct extends StatefulWidget {
  final Product product;
  const selectedProduct({super.key, required this.product});

  @override
  State<selectedProduct> createState() => _selectedProductState(product: product);
}

class _selectedProductState extends State<selectedProduct> {
  final Product product;
  late double totalAmount = product.price;
  int numberOfOrders = 1;

  _selectedProductState({required this.product});

  @override
  void initState() {
    super.initState();
    totalAmount = product.price;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        backgroundColor: Colors.orange[400],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.network(product.url),
              Text(widget.product.productName),
              Text(widget.product.description),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₱ ${totalAmount.toString()}',
                style:  TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: (){
                        setState(() {
                          if(numberOfOrders > 1){
                            numberOfOrders -= 1;
                            totalAmount = product.price * numberOfOrders;
                          }
                        });
                      },
                      icon: Icon(Icons.remove)
                  ),
                  Text(
                    numberOfOrders.toString(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  IconButton(
                      onPressed: (){
                        setState(() {
                          numberOfOrders +=1;
                          totalAmount = product.price * numberOfOrders;
                        });
                      },
                      icon: Icon(Icons.add)
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/cart');
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[600],
                foregroundColor: Colors.grey[200]
            ),
            child:  const Row(
              children: <Widget>[
                Icon(Icons.add_shopping_cart),
                SizedBox(width: 80,),
                Text(
                  'Add to Cart',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}