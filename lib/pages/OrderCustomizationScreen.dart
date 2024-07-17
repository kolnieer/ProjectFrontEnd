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
  List<String> addons = [];

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

  void addAddon(String addon) {
    setState(() {
      addons.contains(addon) ? addons.remove(addon) : addons.add(addon);
    });
  }

  double calculateTotal() {
    double addonsTotal = addons.length * 9.0;
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
                                Text('Select Sugar Level:', style: TextStyle(fontSize: 18)),
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
                          VerticalDivider(
                            width: 30,
                            thickness: 3.0,
                            color: Colors.brown,
                          ),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Select Add-ons:', style: TextStyle(fontSize: 18)),
                                ...availableAddons.map((addon) {
                                  return CheckboxListTile(
                                    title: Text(addon),
                                    value: addons.contains(addon),
                                    onChanged: (bool? value) {
                                      if (value != null) {
                                        addAddon(addon);
                                      }
                                    },
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

                SizedBox(height: 16.0),
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
