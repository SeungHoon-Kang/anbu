import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/cart_bloc/cart_bloc.dart';
import '../cart/payment_page.dart';
import 'bloc/wishlist_bloc.dart';
import 'bloc/wishlist_event.dart';
import 'bloc/wishlist_state.dart';
import 'components/coupon.dart';
import 'components/dummy_product.dart';
import 'components/product_tab.dart';
import 'components/rating_review.dart'; // 임포트 경로를 적절하게 조정하세요.

class ProductDetailPage extends StatefulWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _updateFavoriteStatus();
  }

  void _updateFavoriteStatus() {
    context.read<WishlistBloc>().stream.listen((state) {
      if (state is WishlistLoaded) {
        setState(() {
          isFavorite = state.wishlistItems
              .any((product) => product.productId == widget.product.productId);
        });
      }
    });
  }

  void addToCart(Product product) {
    context.read<CartBloc>().add(
          AddToCartEvent(
            CartItem(
              product.productId,
              product.title,
              1,
              product.price,
              imageUrl: product.imageUrl,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Detail')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              widget.product.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Brand: ${widget.product.brandName}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Price: \$${widget.product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  RatingAndReviewSection(
                    rating: widget.product.starRating,
                    reviewCount: 1234,
                    onTapReviews: () {},
                  ),
                  SizedBox(height: 8),
                  CouponSection(
                    availableCoupons: ['10% OFF', 'Free Shipping'],
                  ),
                  SizedBox(height: 8),
                  ProductTabs(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          bool isFavorite = false;
          if (state is WishlistLoaded) {
            isFavorite = state.wishlistItems.any(
                (product) => product.productId == widget.product.productId);
          }
          return Row(
            children: [
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : null,
                ),
                onPressed: () {
                  if (isFavorite) {
                    context
                        .read<WishlistBloc>()
                        .add(RemoveFromWishlistEvent(widget.product));
                  } else {
                    context
                        .read<WishlistBloc>()
                        .add(AddToWishlistEvent(widget.product));
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  CartItem cartItem = CartItem(
                    widget.product.productId,
                    widget.product.title,
                    1, // 기본 수량 1로 설정
                    widget.product.price,
                    isSelected: false,
                    imageUrl: widget.product.imageUrl,
                  );
                  context.read<CartBloc>().add(AddToCartEvent(cartItem));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${widget.product.title} added to cart'),
                    ),
                  );
                },
                child: Text('Add to Cart'),
              ),
              ElevatedButton(
                onPressed: () {
                  CartItem cartItem = CartItem(
                    widget.product.productId,
                    widget.product.title,
                    1, // 기본 수량 1로 설정
                    widget.product.price,
                    isSelected: false,
                    imageUrl: widget.product.imageUrl,
                  );

                  // 장바구니에 상품을 추가
                  context.read<CartBloc>().add(AddToCartEvent(cartItem));

                  // 결제 페이지로 이동
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(
                        cartItems: [cartItem], // 직접 생성한 cartItem 전달
                        // 다른 결제 정보들...
                      ),
                    ),
                  );
                },
                child: Text('Buy Now'),
              ),
            ],
          );
        },
      ),
    );
  }
}
