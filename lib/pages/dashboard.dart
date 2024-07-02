import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Home'
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[400],
      ),
      body: Container(
        child:  SafeArea(
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/menu');
                  },
                  child: Text('Go to Menu'),
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Text('Go to Profile'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}