import 'package:flutter/material.dart';

import '../../../../bloc/cart_bloc/cart_bloc.dart';

class PaymentPage extends StatelessWidget {
  final List<CartItem> cartItems;
  final String? name;
  final String? contact;
  final String? address;
  final String? deliveryNote;

  PaymentPage({
    required this.cartItems,
    this.name,
    this.contact,
    this.address,
    this.deliveryNote,
  });

  @override
  Widget build(BuildContext context) {
    double totalProductAmount =
        cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);
    double deliveryFee = 5.0; // 예시로 배송비를 5.0으로 설정
    double discount = 10.0; // 예시로 할인 금액을 10.0으로 설정
    double totalAmount =
        totalProductAmount + deliveryFee - discount; // 최종 결제 금액 계산
    return Scaffold(
      appBar: AppBar(
        title: Text('주문/결제'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('배송지 정보'),
                  SizedBox(height: 8),
                  Text('주소: $address'),
                  Text('연락처: $contact'),
                  Text('이름: $name'),
                  SizedBox(height: 16),
                  Text('결제 수단 정보'),
                  // 결제 수단 정보를 표시해야 하는 부분
                  SizedBox(height: 16),
                  Text('배송 메모: $deliveryNote'),
                  SizedBox(height: 16),
                  Divider(),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return ListTile(
                  leading: Image.asset(cartItem.imageUrl),
                  title: Text(cartItem.productName),
                  subtitle: Text('\$${cartItem.price.toStringAsFixed(2)}'),
                  trailing: Text('수량: ${cartItem.quantity}'),
                );
              },
            ),
            // 결제 금액 정보
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('총 상품 금액: \$${totalProductAmount.toStringAsFixed(2)}'),
                  Text('배송비: \$${deliveryFee.toStringAsFixed(2)}'),
                  Text('할인금액: -\$${discount.toStringAsFixed(2)}'),
                  SizedBox(height: 16),
                  Divider(),
                  Text('결제 예정 금액: \$${totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            // 전체 동의하기 및 결제 수단 선택
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (bool? value) {},
                  ),
                  Text('전체 동의하기'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('결제 수단 선택'),
                    ListTile(
                      title: Text('카카오페이'),
                      leading: Radio(
                        value: 'kakao',
                        groupValue: 'selectedPayment',
                        onChanged: (String? value) {},
                      ),
                    ),
                    ListTile(
                      title: Text('네이버페이'),
                      leading: Radio(
                        value: 'naver',
                        groupValue: 'selectedPayment',
                        onChanged: (String? value) {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 결제하기 버튼
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('결제 금액: \$${totalAmount.toStringAsFixed(2)}'),
                    SizedBox(width: 8.0),
                    Text('주문하기'),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
