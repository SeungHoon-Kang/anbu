import 'package:flutter/material.dart';

import '../../../../bloc/cart_bloc/cart_bloc.dart';

class OrderDetailsPage extends StatelessWidget {
  final List<CartItem> cartItems;

  OrderDetailsPage(String status, {required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주문 정보'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          return ListTile(
            leading: Image.network(cartItem.imageUrl),
            title: Text(cartItem.productName),
            subtitle: Text('\$${cartItem.price.toStringAsFixed(2)}'),
            trailing: Text('수량: ${cartItem.quantity}'),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '결제가 성공적으로 완료되었습니다!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // 주문 정보 페이지를 떠나 다른 페이지로 이동하거나 앱을 종료할 수 있습니다.
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Text('홈으로 돌아가기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
