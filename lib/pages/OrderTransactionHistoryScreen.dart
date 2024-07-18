import 'package:flutter/material.dart';

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
  ];

  List<bool> showDetails = [];
  @override
  void initState() {
    super.initState();
    // Initialize showDetails list with false for each transaction
    showDetails = List.generate(transactions.length, (index) => false);
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
            child: ListView.builder(
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
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/menu');
              },
              icon: Icon(Icons.menu), // Icon added here
              label: Text('Back to Menu'),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
