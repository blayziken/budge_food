import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProcessedOrder {
  final String id;
  final int amount;
  final List order;
  final String address;
//  final String phoneNumber;
//  final String shopName;
  final DateTime dateTime;
  final bool isCompleted = false;

  ProcessedOrder({
    this.id,
    @required this.amount,
//    @required this.phoneNumber,
    @required this.order,
//    @required this.shopName,
    @required this.address,
    this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<ProcessedOrder> _orders = [];

  List<ProcessedOrder> get orders {
    return [..._orders];
  }

  Future<void> addProcessedOrder(ProcessedOrder processedOrders) {
    const url =
        'https://school-delivery-13721-default-rtdb.firebaseio.com/orders.json';

    return http
        .post(Uri.parse(url),
            body: json.encode({
              'amount': processedOrders.amount,
              'address': processedOrders.address,
              'order': processedOrders.order,
//          'phoneNumber': processedOrders.phoneNumber,
//          'shopName': processedOrders.shopName,
              'isCompleted': processedOrders.isCompleted,
              'dateTime': DateTime.now().toString(),
            }))
        .then((response) {
      final newOrder = ProcessedOrder(
        id: json.decode(response.body)['name'],
        amount: processedOrders.amount,
        address: processedOrders.address,
        order: processedOrders.order,
//        phoneNumber: processedOrders.phoneNumber,
//        shopName: processedOrders.shopName,
        dateTime: DateTime.now(),
      );

      _orders.insert(0, newOrder);

      notifyListeners();
    }).catchError((error) {
      throw (error);
    });
  }
}
