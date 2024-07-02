import 'package:bigbrewteatech/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:bigbrewteatech/pages/login.dart';
import 'package:bigbrewteatech/pages/dashboard.dart';
import 'package:bigbrewteatech/pages/menu.dart';
import 'package:bigbrewteatech/pages/signup.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/Login',
  routes: {
    '/' : (context) => Dashboard(),
    '/menu' : (context) => Menu(),
    '/profile' : (context) => Profile(),
    '/Signup' : (context) => Signup(),
    '/Login' : (context) => Login(),

  },
));