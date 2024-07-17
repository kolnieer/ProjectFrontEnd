import 'package:flutter/material.dart';

class checkout extends StatefulWidget {
  const checkout({super.key});

  @override
  State<checkout> createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('My Order'),
        backgroundColor: Colors.orange[400],
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/profile');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white60,
                      foregroundColor: Colors.grey[200]
                  ),
                  child:  const Row(
                    children: <Widget>[
                      Icon(
                          Icons.person_2_rounded,
                        color: Colors.black,
                      ),

                      SizedBox(width: 80,),
                      Column(
                        children: [
                          Text(
                            'Recipients Details',
                            style: TextStyle(
                              wordSpacing: 5.0,
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Trixie Catibog',
                            style: TextStyle(
                              wordSpacing: 5.0,
                              fontSize: 19.0,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/deliveryaddress');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white60,
                      foregroundColor: Colors.grey[200]
                  ),
                  child:  const Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.black,
                      ),

                      SizedBox(width: 80,),
                      Column(
                        children: [
                          Text(
                            'Delivery Address',
                            style: TextStyle(
                              wordSpacing: 5.0,
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Cayponce Balayan',
                            style: TextStyle(
                              wordSpacing: 5.0,
                              fontSize: 19.0,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/paymentmethod');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white60,
                      foregroundColor: Colors.grey[200]
                  ),
                  child:  const Row(
                    children: <Widget>[
                      Icon(
                        Icons.payment,
                        color: Colors.black,
                      ),

                      SizedBox(width: 80,),
                      Column(
                        children: [
                          Text(
                            'Payment Method',
                            style: TextStyle(
                              wordSpacing: 5.0,
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Cash on Delivery',
                            style: TextStyle(
                              wordSpacing: 5.0,
                              fontSize: 19.0,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
                    Icon(Icons.shopping_bag),
                    SizedBox(width: 80,),
                    Text(
                      'Track Order',
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
          )
        ],
      ),
    );
  }
}
