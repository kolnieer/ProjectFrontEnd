import 'package:flutter/material.dart';

class OrderCustomizationScreen extends StatefulWidget {
  @override
  _OrderCustomizationScreenState createState() => _OrderCustomizationScreenState();
}

class _OrderCustomizationScreenState extends State<OrderCustomizationScreen> {
  String? selectedBranch;
  int quantity = 1;
  String? selectedSugarLevel;
  String? selectedCupSize;
  int nata = 0;
  int coffeejelly = 0;
  int pearl = 0;
  int cheesecake = 0;
  int grassjelly = 0;
  Map<String, int> addons = {};

  List<String> availableBranches = [
    'Martinez St. Balayan',
    'Calaca Poblacion',
  ];

  List<String> sugarLevels = [
    '25%', '50%', '75%', '100%',
  ];

  List<String> availableCupSizes = [
    'Medio - ₱29',
    'Grande - ₱39',
  ];

  List<String> availableAddons = [
    'Nata', 'Coffee Jelly', 'Pearl', 'CheeseCake', 'Grass Jelly',
  ];

  double getBasePrice() {
    if (selectedCupSize == null) return 0.0;
    switch (selectedCupSize) {
      case 'Medio - ₱29':
        return 29.0;
      case 'Grande - ₱39':
        return 39.0;
      default:
        return 0.0;
    }
  }

  void updateAddonQuantity(String addon, int scoops) {
    setState(() {
      if (scoops > 0) {
        addons[addon] = scoops;
      } else {
        addons.remove(addon);
      }
    });
  }

  double calculateTotal() {
    double addonsTotal = addons.values.fold(0, (previous, current) => previous + (current * 9.0));
    return (getBasePrice() * quantity) + addonsTotal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Customization'),
        backgroundColor: Colors.orange[400],
      ),
      backgroundColor: Colors.orange[600],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 5),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Select Sugar Level:', style: TextStyle(fontSize: 15)),
                                ...sugarLevels.map((sugar) {
                                  return RadioListTile<String>(
                                    title: Text(sugar),
                                    value: sugar,
                                    groupValue: selectedSugarLevel,
                                    onChanged: (String? value) {
                                      setState(() {
                                        selectedSugarLevel = value;
                                      });
                                    },
                                  );
                                }).toList(),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Select Add-ons:', style: TextStyle(fontSize: 18)),
                                ...availableAddons.map((addon) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(addon),
                                      SizedBox(width: 10),
                                      DropdownButton<int>(
                                        hint: Text('Scoops', style: TextStyle(fontSize: 14)),
                                        value: addons.containsKey(addon) ? addons[addon] : null,
                                        onChanged: (int? scoops) {
                                          setState(() {
                                            if (scoops != null && scoops >= 0 && scoops <= 3) {
                                              switch (addon) {
                                                case 'Nata':
                                                  nata = scoops;
                                                  print('Nata Scoops: $nata');
                                                  break;
                                                case 'Coffee Jelly':
                                                  coffeejelly = scoops;
                                                  print('Coffee Jelly Scoops: $coffeejelly');
                                                  break;
                                                case 'Pearl':
                                                  pearl = scoops;
                                                  print('Pearl Scoops: $pearl');
                                                  break;
                                                case 'CheeseCake':
                                                  cheesecake = scoops;
                                                  print('CheeseCake Scoops: $cheesecake');
                                                  break;
                                                case 'Grass Jelly':
                                                  grassjelly = scoops;
                                                  print('Grass Jelly Scoops: $grassjelly');
                                                  break;
                                              }

                                              if (scoops > 0) {
                                                addons[addon] = scoops;
                                              } else {
                                                addons.remove(addon);
                                              }
                                            }
                                          });
                                        },
                                        items: [0, 1, 2, 3].map<DropdownMenuItem<int>>((int value) {
                                          return DropdownMenuItem<int>(
                                            value: value,
                                            child: Text(value == 0 ? 'None' : value.toString()),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Select Cup Size:', style: TextStyle(fontSize: 18)),
                          DropdownButton<String>(
                            hint: Text('Choose cup size', style: TextStyle(fontSize: 14)),
                            value: selectedCupSize,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCupSize = newValue;
                              });
                            },
                            items: availableCupSizes.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.0),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 5),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Select Branch', style: TextStyle(fontSize: 16, color: Colors.white)),
                                DropdownButton<String>(
                                  hint: Text('Choose a branch', style: TextStyle(fontSize: 14, color: Colors.white)),
                                  value: selectedBranch,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedBranch = newValue;
                                    });
                                  },
                                  items: availableBranches.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value, style: TextStyle(color: Colors.black)),
                                    );
                                  }).toList(),
                                  style: TextStyle(color: Colors.white),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('Quantity:', style: TextStyle(fontSize: 18, color: Colors.white)),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove, color: Colors.white),
                                      onPressed: () {
                                        if (quantity > 1) setState(() => quantity--);
                                      },
                                    ),
                                    Text(quantity.toString(), style: TextStyle(fontSize: 18, color: Colors.white)),
                                    IconButton(
                                      icon: Icon(Icons.add, color: Colors.white),
                                      onPressed: () {
                                        setState(() => quantity++);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 16.0),
                      Text(
                        'Total Amount: ₱${calculateTotal().toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        'Base Price: ₱${getBasePrice().toStringAsFixed(2)} x $quantity + Add-ons (₱9 each)',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 5),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/checkout');
                        },
                        icon: Icon(Icons.add),
                        label: Text('Add Order'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          padding: EdgeInsets.symmetric(horizontal: 20),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/cart');
                        },
                        icon: Icon(Icons.shopping_cart),
                        label: Text('Add to Cart'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          padding: EdgeInsets.symmetric(horizontal: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
