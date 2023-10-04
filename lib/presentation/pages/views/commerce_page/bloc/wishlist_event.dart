// wishlist_event.dart

import '../components/dummy_product.dart';

abstract class WishlistEvent {}

class AddToWishlistEvent extends WishlistEvent {
  final Product product;

  AddToWishlistEvent(this.product);
}

class RemoveFromWishlistEvent extends WishlistEvent {
  final Product product;

  RemoveFromWishlistEvent(this.product);
}
