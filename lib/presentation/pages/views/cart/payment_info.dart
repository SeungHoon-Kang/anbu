import 'package:flutter/material.dart';

class PaymentInfoSection extends StatelessWidget {
  final double totalAmount;
  final double discount;
  final double deliveryFee;

  PaymentInfoSection({
    required this.totalAmount,
    required this.discount,
    required this.deliveryFee,
  });

  @override
  Widget build(BuildContext context) {
    double finalAmount = totalAmount - discount + deliveryFee;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        ListTile(
          title: Text('상품 총액'),
          trailing: Text('\$${totalAmount.toStringAsFixed(2)}'),
        ),
        ListTile(
          title: Text('할인금액'),
          trailing: Text('- \$${discount.toStringAsFixed(2)}'),
        ),
        ListTile(
          title: Text('배송비'),
          trailing: Text('\$${deliveryFee.toStringAsFixed(2)}'),
        ),
        Divider(),
        ListTile(
          title: Text('최종 결제금액', style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: Text('\$${finalAmount.toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
