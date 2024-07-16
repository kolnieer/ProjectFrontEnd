import 'package:flutter/material.dart';
import 'package:order_tracker_zen/order_tracker_zen.dart';

class trackorder extends StatefulWidget {
  const trackorder({super.key});

  @override
  State<trackorder> createState() => _trackorderState();
}

class _trackorderState extends State<trackorder> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Track your Order'),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
              child: OrderTrackerZen(
                success_color: Colors.orange[600],
                screen_background_color: Colors.orange[600],

                  tracker_data: [
                    TrackerData(
                        title: 'Order Placement',
                        date: 'July 16, 2024',
                        tracker_details: [
                          TrackerDetails(
                              title: 'Placed order',
                              datetime: 'July 16, 2020- 12:30pm'
                          ),
                        ],
                    ),
                    TrackerData(
                        title: 'Order Preparing',
                        date: '',
                        tracker_details: [
                          TrackerDetails(
                              title: '',
                              datetime: '',
                          ),
                        ],
                    ),
                    TrackerData(
                        title: 'Order ready to Deliver',
                        date: '',
                        tracker_details: [
                          TrackerDetails(
                              title: '',
                              datetime: '',
                          ),
                        ],
                    ),
                    TrackerData(
                        title: 'Order is on its way',
                        date: '',
                        tracker_details: [
                          TrackerDetails(
                              title: '',
                              datetime: '',
                          ),
                        ],
                    ),
                    TrackerData(
                        title: 'Order Delivered',
                        date: '',
                        tracker_details: [
                          TrackerDetails(
                              title: '',
                              datetime: '',
                          ),
                        ],
                    ),
               ],
              )
            )
          ]
    ),
    ),
    );
    }
  }

