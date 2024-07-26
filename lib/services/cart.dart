import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class cart{
  final int cartId;
  final String product;
  final int userId;
  final int quantity;
  final double price;

  cart({
    required this.cartId,
    required this.product,
    required this.userId,
    required this.quantity,
    required this.price,});

  factory cart.fromJson(Map<String, dynamic> json){
    return switch(json){
      {
      'cartId' : int cartId,
      'product' : String product,
      'userId' : int userId,
      'quantity' : int quantity,
      'price' : double price,
      } =>
          cart(
            cartId : cartId,
            product : product,
            userId : userId,
            quantity : quantity,
            price : price,
          ),
      _ => throw const FormatException('Failed to load products')
    };
  }
}