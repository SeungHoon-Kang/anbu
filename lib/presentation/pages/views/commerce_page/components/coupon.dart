import 'package:flutter/material.dart';

class CouponSection extends StatelessWidget {
  final List<String> availableCoupons;

  const CouponSection({
    required this.availableCoupons,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Column(
                children:
                    availableCoupons.map((coupon) => Text(coupon)).toList(),
              ),
            );
          },
        );
      },
      child: Text('Available Coupons'),
    );
  }
}
