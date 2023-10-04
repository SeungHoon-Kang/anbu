import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../bloc/cart_bloc/cart_bloc.dart';
import '../product_detail_page.dart';
import 'dummy_product.dart';

class PopularProducts extends StatelessWidget {
  final List<Product> products;

  PopularProducts({required this.products});

  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '인기 상품',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                child: Container(
                  width: double.infinity,
                  height: 180, // Adjust the height to ensure content fits
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 60,
                        child: Image.asset(
                          product.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        product.brandName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12, // Adjust font size to fit
                        ),
                      ),
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 12, // Adjust font size to fit
                        ),
                      ),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12, // Adjust font size to fit
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 12, // Adjust icon size to fit
                          ),
                          Text(
                            product.starRating.toString(),
                            style: TextStyle(
                              fontSize: 12, // Adjust font size to fit
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // "추가하기" 버튼을 눌렀을 때 상품을 장바구니에 추가
                              CartItem cartItem = CartItem(
                                product.productId,
                                product.title,
                                1, // 기본 수량 1로 설정
                                product.price,
                                isSelected: false,
                                imageUrl: product.imageUrl,
                              );
                              cartBloc.add(AddToCartEvent(
                                  cartItem)); // 이미 프로바이드 받은 cartBloc을 사용합니다.
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('${product.title} added to cart'),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 12, // Adjust icon size to fit
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(product: product),
                    ),
                  );
                },
              );
            },
            itemCount: products.length,
          ),
        ],
      ),
    );
  }
}
