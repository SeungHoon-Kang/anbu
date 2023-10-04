import 'package:flutter/material.dart';

import 'utils/order_item.dart';

class MyOrderStatusPage extends StatelessWidget {
  final String orderStatus;
  final List<OrderItem> orderItems; // Replace with actual order data model

  MyOrderStatusPage({required this.orderStatus, required this.orderItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$orderStatus'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final orderItem = orderItems[index];

          return ListTile(
            leading: Image.network(orderItem.imageUrl),
            title: Text(orderItem.productName),
            subtitle: Text('\$${orderItem.price.toStringAsFixed(2)}'),
            trailing: Text('수량: ${orderItem.quantity}'),
          );
        },
        itemCount: orderItems.length,
      ),
    );
  }
}
