import 'package:bigbrewteatech/pages/OrderCustomizationScreen.dart';
import 'package:bigbrewteatech/pages/OrderTransactionHistoryScreen.dart';
import 'package:bigbrewteatech/pages/menu.dart';
import 'package:bigbrewteatech/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:bigbrewteatech/pages/signup.dart';
import 'package:bigbrewteatech/pages/login.dart';
import 'package:bigbrewteatech/pages/dashboard.dart';
import 'package:bigbrewteatech/pages/cart.dart';
import 'package:bigbrewteatech/pages/trackorder.dart';
import 'package:bigbrewteatech/pages/checkout.dart';
import 'package:bigbrewteatech/pages/deliveryaddress.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/OrderCustomizationScreen',
  routes: {
    '/' : (context) => Dashboard(),
    '/menu' : (context) => Menu(),
    '/profile' : (context) => Profile(),
    '/signup' : (context) => Signup(),
    '/login' : (context) => Login(),
    '/cart' : (context) => Cart(),
    '/trackorder' : (context) => trackorder(),
    '/OrderCustomizationScreen' : (context) => OrderCustomizationScreen(),
    '/OrderTransactionHistoryScreen' : (context) => OrderTransactionHistoryScreen(),
    '/checkout' : (context) => checkout(),
    '/deliveryaddress' : (context) => deliveryaddress(),

  },
));