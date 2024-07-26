import 'dart:convert';
import 'package:bigbrewteatech/pages/trackorder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class TrackingOrder {
  final String OrderPlacement;
  final String OrderPreparing;
  final String OrderReadytoDeliver;
  final String OrderisonitsWay;
  final String OrderDelivered;

  TrackingOrder({
    required this.OrderPlacement,
    required this.OrderPreparing,
    required this.OrderReadytoDeliver,
    required this.OrderisonitsWay,
    required this.OrderDelivered,});

  factory TrackingOrder.fromJson(Map<String, dynamic> json){
    return switch(json){
      {
      'OrderPlacement' : String OrderPlacement,
      'OrderPreparing' : String OrderPreparing,
      'OrderReadytoDeliver' : String OrderReadytoDeliver,
      'OrderisonitsWay' : String OrderisonitsWay,
      'OrderDelivered' : String OrderDelivered,
      } =>
          TrackingOrder(
            OrderPlacement : OrderPlacement,
            OrderPreparing : OrderPreparing,
            OrderReadytoDeliver : OrderReadytoDeliver,
            OrderisonitsWay : OrderisonitsWay,
            OrderDelivered : OrderDelivered,
          ),
      _ => throw const FormatException('Failed to load products')
    };
  }
}