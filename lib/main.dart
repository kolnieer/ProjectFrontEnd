import 'package:bigbrewteatech/pages/menu.dart';
import 'package:bigbrewteatech/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:bigbrewteatech/pages/signup.dart';
import 'package:bigbrewteatech/pages/login.dart';
import 'package:bigbrewteatech/pages/dashboard.dart';
import 'package:bigbrewteatech/pages/cart.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context) => Dashboard(),
    '/menu' : (context) => Menu(),
    '/profile' : (context) => Profile(),
    '/signup' : (context) => Signup(),
    '/login' : (context) => Login(),
    '/cart' : (context) => Cart(),

  },
));