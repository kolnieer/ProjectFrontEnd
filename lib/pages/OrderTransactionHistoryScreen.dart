import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bigbrewteatech/services/TransactionHistory.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class OrderTransaction {
  final String orderId;
  final String date;
  final double totalAmount;
  final String status;
  final String currencySymbol;

  OrderTransaction({
    required this.orderId,
    required this.date,
    required this.totalAmount,
    required this.status,
    this.currencySymbol = '\₱',
  });
}

class OrderTransactionHistoryScreen extends StatefulWidget {
  @override
  _OrderTransactionHistoryScreenState createState() => _OrderTransactionHistoryScreenState();
}

class _OrderTransactionHistoryScreenState extends State<OrderTransactionHistoryScreen> {

  late Future<List<dynamic>> transactions;
  List<bool> showDetails = [];
  Future<List<dynamic>> fetchData() async{
  final response = await http.get(Uri.parse('http://10.0.2.2:8080/api/v1/transactionhistory')
  );
  final data = jsonDecode(response.body);
  print(data);
  List transactions = <OrderTransactionHistoryScreen>[];
  for (var transaction in data){
  transactions.add(TransactionHistory.fromJson(transaction));
  }
  return transactions;
  }

  @override
  void initState() {
  super.initState();
  }



  void toggleDetails(int index) {
    setState(() {
      showDetails[index] = !showDetails[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[600],
      appBar: AppBar(
        title: Text('Order Transaction History'),
        backgroundColor: Colors.orange[400],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: fetchData(),
              builder: (context, snapshots){
                if (snapshots.connectionState == ConnectionState.waiting){
                  return Center(
                      child: SpinKitPouringHourGlassRefined(
                        color: Colors.black87,
                        size: 60.0,
                      )
                  );
                }
                //if waiting

                if(snapshots.hasData){
                  List transactions = snapshots.data!;
                  showDetails = List.generate(transactions.length, (index) => false);
                  return ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = transactions[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        elevation: 4,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('Order ID: ${transaction.orderId}'),
                              trailing: IconButton(
                                icon: Icon(showDetails[index] ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                                onPressed: () {
                                  toggleDetails(index);
                                },
                              ),
                            ),
                            if (showDetails[index])
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 8),
                                    Text(
                                      'Full Details:',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 4),
                                    Text('Date: ${transaction.date}'),
                                    Text(
                                      'Total Amount: ${transaction.currencySymbol}${transaction.totalAmount.toStringAsFixed(2)}',
                                    ),
                                    Text('Status: ${transaction.status}'),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  );
                }
                return Center(
                  child: Text(
                      'Unable to Retrieve Data, Please Try Again',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.0,
                    ),
                  ),
                );
              },
            )
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/menu');
              },
              icon: Icon(Icons.menu),
              label: Text('Back to Menu'),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
