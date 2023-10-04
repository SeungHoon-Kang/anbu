import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/wishlist_bloc.dart';
import '../bloc/wishlist_state.dart';
import '../product_detail_page.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistInitial) {
            return Center(
              child: Text('No items in wishlist.'),
            );
          } else if (state is WishlistLoaded) {
            if (state.wishlistItems.isEmpty) {
              return Center(
                child: Text('No items in wishlist.'),
              );
            } else {
              return ListView.builder(
                itemCount: state.wishlistItems.length,
                itemBuilder: (context, index) {
                  final product = state.wishlistItems[index];
                  return ListTile(
                    title: Text(product.title),
                    subtitle: Text(product.brandName), // 브랜드명 표시
                    leading: Image.asset(product.imageUrl), // 이미지 표시
                    trailing:
                        Text("\$${product.price.toStringAsFixed(2)}"), // 가격 표시
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailPage(product: product),
                      ),
                    ),
                  );
                },
              );
            }
          } else if (state is WishlistError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
