import 'package:flutter/material.dart';

class OrderTransactionHistoryScreen extends StatelessWidget {
  final List<OrderTransaction> transactions = [
    OrderTransaction(
      orderId: '12345',
      date: '2023-10-01',
      totalAmount: 150.00,
      status: 'Completed',
    ),
    OrderTransaction(
      orderId: '12346',
      date: '2023-10-02',
      totalAmount: 200.00,
      status: 'Pending',
    ),
    OrderTransaction(
      orderId: '12347',
      date: '2023-10-03',
      totalAmount: 120.00,
      status: 'Cancelled',
    ),
    // Add more transactions as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Transaction History'),
        backgroundColor: Colors.orange[400],
        elevation: 5,
      ),
      backgroundColor: Colors.orange[600],
      body: SafeArea(
        child: Column(
          children: [
            // Image Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/bigbrew logo.jpg',
                height: 200,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return Card(
                    margin: EdgeInsets.all(12.0),
                    color: Colors.white,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListTile(
                        title: Text(
                          'Order ID: ${transaction.orderId}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8),
                            Text(
                              'Date: ${transaction.date}',
                              style: TextStyle(color: Colors.black54),
                            ),
                            Text(
                              'Total Amount: ₱${transaction.totalAmount.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              'Status: ${transaction.status}',
                              style: TextStyle(
                                color: transaction.status == 'Completed'
                                    ? Colors.green
                                    : transaction.status == 'Pending'
                                    ? Colors.orange
                                    : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        isThreeLine: true,
                        trailing: Icon(Icons.arrow_forward, color: Colors.orange[400]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderTransaction {
  final String orderId;
  final String date;
  final double totalAmount;
  final String status;

  OrderTransaction({
    required this.orderId,
    required this.date,
    required this.totalAmount,
    required this.status,
  });
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.orange,
      cardColor: Colors.white,
      scaffoldBackgroundColor: Colors.orange[600],
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.orange[400],
        elevation: 5,
      ),
    ),
    home: OrderTransactionHistoryScreen(),
  ));
}
