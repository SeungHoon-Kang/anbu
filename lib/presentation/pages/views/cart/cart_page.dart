import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/cart_bloc/cart_bloc.dart';
import 'payment_info.dart';
import 'payment_page.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final TextEditingController deliveryNoteController = TextEditingController();

  String? name;
  String? contact;
  String? address;
  String? deliveryNote;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        print("BlocBuilder is rebuilding!");
        print("BlocBuilder is rebuilding with total: \$${state.total}");
        final cartItems = state.cartItems;
        return Scaffold(
          appBar: AppBar(
            title: Text('장바구니'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true, // Here
                  physics:
                      NeverScrollableScrollPhysics(), // Ensure the listview doesn't interfere with the parent scroll view
                  key: UniqueKey(),
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartItems[index];
                    return CartItemWidget(
                      cartItem: cartItem,
                      index: index,
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '총합: \$${state.total.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),

                      SizedBox(height: 16.0),
                      PaymentInfoSection(
                        // 이 위젯을 여기로 옮깁니다.
                        totalAmount: state.total,
                        discount: 10.0,
                        deliveryFee: 5.0,
                      ),
                      SizedBox(height: 16.0),
                      // 사용자 정보 입력 폼
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (cartItems.isNotEmpty) {
                      // Pass cart items and user info to PaymentPage
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PaymentPage(
                            cartItems: cartItems,
                            name: name,
                            contact: contact,
                            address: address,
                            deliveryNote: deliveryNoteController.text,
                          ),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('장바구니가 비어 있습니다.'),
                            content: Text('상품을 추가해주세요.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('확인'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text('주문하기'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  final int index;

  CartItemWidget({
    required this.cartItem,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            child: Image.asset(cartItem.imageUrl),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cartItem.productName),
                  Text('\$${cartItem.price.toStringAsFixed(2)}'),
                ],
              ),
            ),
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  context.read<CartBloc>().add(
                        DecrementItemQuantityEvent(index),
                      );
                },
              ),
              Text('${cartItem.quantity}'),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  context.read<CartBloc>().add(
                        IncrementItemQuantityEvent(index),
                      );
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CartBloc>().add(
                    RemoveFromCartEvent(cartItem),
                  );
            },
            child: Text('제거'),
          ),
        ],
      ),
    );
  }
}
