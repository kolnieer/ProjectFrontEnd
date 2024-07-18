import 'package:flutter/material.dart';
import 'package:map_picker_flutter/map_picker.dart';
import 'package:map_picker_flutter/mpicker_address.dart';
import 'package:map_picker_flutter/mpicker_controller.dart';
import 'package:map_picker_flutter/mpicker_templates.dart';
import 'package:map_picker_flutter/mpicker_theme.dart';

class deliveryaddress extends StatefulWidget {
  const deliveryaddress({super.key});

  @override
  State<deliveryaddress> createState() => _deliveryaddressState();
}

class _deliveryaddressState extends State<deliveryaddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        title: Text('Select Branch'),
    backgroundColor: Colors.orange[400],
    centerTitle: true,
        ),
    );
  }
}
