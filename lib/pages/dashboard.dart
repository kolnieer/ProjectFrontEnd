import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 5.0),
            child: Container(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Image(
                          image: AssetImage('assets/bigbrew logo.jpg'),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      TextField(
                        decoration: InputDecoration(
                            label: Text(
                              'Search your favorites',
                              style: TextStyle(
                                  color: Colors.grey[500]
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide.none
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            prefixIcon: Icon(
                                Icons.search
                            ),
                            prefixIconColor: Colors.grey[500],
                            hintText: 'Search your favorites',
                            hintStyle: TextStyle(
                                color: Colors.grey[500]
                            ),
                            filled: true,
                            fillColor: Colors.grey[300]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                        child: ExpandableCarousel(
                          options: CarouselOptions(
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 5),
                          ),
                          items: [
                            'assets/menu1.jpg',
                            'assets/menu2.jpg',
                            'assets/menu3.jpg',
                            'assets/menu4.jpg',
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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