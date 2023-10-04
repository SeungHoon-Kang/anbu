import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/dummy_product.dart';
import 'wishlist_event.dart';
import 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<AddToWishlistEvent>((event, emit) {
      if (state is WishlistLoaded) {
        final currentWishlist =
            List<Product>.from((state as WishlistLoaded).wishlistItems);

        if (!currentWishlist
            .any((product) => product.productId == event.product.productId)) {
          currentWishlist.add(event.product);
          emit(WishlistLoaded(currentWishlist));
        }
      } else {
        // If the state is not WishlistLoaded, create a new wishlist and add the product
        emit(WishlistLoaded([event.product]));
      }
    });

    on<RemoveFromWishlistEvent>((event, emit) {
      if (state is WishlistLoaded) {
        final updatedWishlist =
            List<Product>.from((state as WishlistLoaded).wishlistItems);
        updatedWishlist.remove(event.product);
        emit(WishlistLoaded(updatedWishlist));
      }
    });
  }
}
