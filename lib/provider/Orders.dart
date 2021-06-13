import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class ProcessedOrder {
  final String id;
  final int amount;
  final List order;
  final String address;
//  final String phoneNumber;
//  final String shopName;
  final String dateTime;
  final bool isCompleted = false;

  ProcessedOrder({
    this.id,
    @required this.amount,
//    @required this.phoneNumber,
    @required this.order,
//    @required this.shopName,
    @required this.address,
    this.dateTime,
//    this.isCompleted,
  });
}

class Orders with ChangeNotifier {
  List<ProcessedOrder> _orders = [];

  final String authToken;

  Orders(this.authToken, this._orders);

  List<ProcessedOrder> get orders {
    return [..._orders];
  }

  // ADD ORDER IMPLEMENTATION
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
              'dateTime': DateFormat('dd/MM/yyyy hh:mm').format(DateTime.now()),
            }))
        .then((response) {
      final newOrder = ProcessedOrder(
        id: json.decode(response.body)['name'],
        amount: processedOrders.amount,
        address: processedOrders.address,
        order: processedOrders.order,
//        phoneNumber: processedOrders.phoneNumber,
//        shopName: processedOrders.shopName,
        dateTime: DateFormat('dd/MM/yyyy hh:mm').format(DateTime.now()),
      );

      _orders.insert(0, newOrder);

      notifyListeners();
    }).catchError((error) {
      throw (error);
    });
  }

  // GET ORDERS IMPLEMENTATION
  Future<void> getProcessedOrders() async {
    final url =
        'https://school-delivery-13721-default-rtdb.firebaseio.com/orders.json?auth=$authToken';

    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<dynamic, dynamic>;

      print('--------------------------------------------------------------');
      print(extractedData);
      print('--------------------------------------------------------------');

      final List<ProcessedOrder> loadedOrders = [];
      extractedData.forEach((id, orderData) {
        loadedOrders.add(ProcessedOrder(
          id: id,
          address: orderData['address'],
          amount: orderData['amount'],
          dateTime: orderData['dateTime'],
          order: orderData['order'],
//          isCompleted: orderData['isCompleted'],
        ));
      });

      print(loadedOrders);
      _orders = loadedOrders;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
