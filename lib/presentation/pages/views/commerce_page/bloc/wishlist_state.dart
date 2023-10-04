import '../components/dummy_product.dart';

abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final List<Product> wishlistItems;

  WishlistLoaded(this.wishlistItems);
}

class WishlistError extends WishlistState {
  final String message;

  WishlistError(this.message);
}
