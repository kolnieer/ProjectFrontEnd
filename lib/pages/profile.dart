import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int year = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[600],
      appBar: AppBar(
        title: Text('User Profile'),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget> [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 0),
                  child: ExpandableCarousel(
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 1)
                    ),
                    items: [
                      'assets/Carousel 1.jpg',
                      'assets/Carousel 2.jpg',
                      'assets/carousel 3.jpg',
                      'assets/carousel 4.jpeg',
                    ].map((String imagePath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.pink
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.cover,
                                ),
                              )
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                Divider(
                  height: 55.0,
                  color: Colors.brown[800],
                  thickness: 5.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person_2,
                      color:Colors.grey[800],
                    ),
                    SizedBox(width: 3.0,),
                    Text(
                      'NAME',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Trixie Anne Legaspi Catibog',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0
                  ),
                ),
                SizedBox(height: 30.0,),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_sharp,
                      color: Colors.grey[800],
                    ),
                    SizedBox(width: 4.0,),
                    Text(
                      'AGE',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  '$year Years Old',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 30.0,),
                Row(
                  children: [
                    Icon(
                      Icons.email_sharp,
                      color: Colors.grey[800],
                    ),
                    SizedBox(width: 4.0,),
                    Text(
                      'EMAIL',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  'trixieannlegaspicatibog@gmail.com',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      year +=1;
                    });
                  },
                  child: Text('Add Year'),
                ),
                GradientElevatedButton(
                  onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                  },
                  style: GradientElevatedButton.styleFrom(
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(255, 129, 133, 127),
                      Color.fromARGB(225, 145, 178, 195),
                    ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: const Text("LOG OUT YOUR ACCOUNT"),

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}