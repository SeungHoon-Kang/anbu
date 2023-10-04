import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Event classes
abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCartEvent extends CartEvent {
  final CartItem item;

  AddToCartEvent(this.item);

  @override
  List<Object> get props => [item];
}

class RemoveFromCartEvent extends CartEvent {
  final CartItem item;

  RemoveFromCartEvent(this.item);

  @override
  List<Object> get props => [item];
}

class ToggleItemSelectionEvent extends CartEvent {
  final int index;

  ToggleItemSelectionEvent(this.index);

  @override
  List<Object> get props => [index];
}

class DeleteSelectedItemsEvent extends CartEvent {}

class IncrementItemQuantityEvent extends CartEvent {
  final int index;

  IncrementItemQuantityEvent(this.index);

  @override
  List<Object> get props => [index];
}

class DecrementItemQuantityEvent extends CartEvent {
  final int index;

  DecrementItemQuantityEvent(this.index);

  @override
  List<Object> get props => [index];
}

// State class
class CartItem extends Equatable {
  final String productId;
  final String productName;
  int quantity;
  final double price;
  bool isSelected;
  final String imageUrl;

  CartItem(
    this.productId,
    this.productName,
    this.quantity,
    this.price, {
    this.isSelected = false,
    this.imageUrl = '',
  });

  CartItem copyWith({
    int? quantity,
    bool? isSelected,
  }) {
    return CartItem(
      this.productId,
      this.productName,
      quantity ?? this.quantity,
      this.price,
      isSelected: isSelected ?? this.isSelected,
      imageUrl: this.imageUrl,
    );
  }

  @override
  List<Object?> get props =>
      [productId, productName, quantity, price, isSelected, imageUrl];
}

class CartState extends Equatable {
  final List<CartItem> cartItems;

  CartState(this.cartItems);

  double get total =>
      cartItems.fold(0, (total, item) => total + (item.price * item.quantity));

  @override
  List<Object?> get props => [cartItems];
}

// Bloc class
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState([])) {
    on<AddToCartEvent>((event, emit) {
      final updatedCart = List<CartItem>.of(state.cartItems);
      updatedCart.add(event.item);
      emit(CartState(updatedCart));
    });

    on<RemoveFromCartEvent>((event, emit) {
      final updatedCart = List<CartItem>.of(state.cartItems);
      updatedCart.removeWhere((item) => item.productId == event.item.productId);
      emit(CartState(updatedCart));
    });

    on<ToggleItemSelectionEvent>((event, emit) {
      final updatedCart = List<CartItem>.of(state.cartItems);
      updatedCart[event.index].isSelected =
          !updatedCart[event.index].isSelected;
      emit(CartState(updatedCart));
    });

    on<DeleteSelectedItemsEvent>((event, emit) {
      final updatedCart =
          List<CartItem>.of(state.cartItems.where((item) => !item.isSelected));
      emit(CartState(updatedCart));
    });

    on<IncrementItemQuantityEvent>((event, emit) {
      final updatedCart = List<CartItem>.from(state.cartItems);
      final updatedItem = updatedCart[event.index]
          .copyWith(quantity: updatedCart[event.index].quantity + 1);
      updatedCart[event.index] = updatedItem;
      emit(CartState(updatedCart));
    });

    on<DecrementItemQuantityEvent>((event, emit) {
      final updatedCart = List<CartItem>.from(state.cartItems);
      if (updatedCart[event.index].quantity > 1) {
        final updatedItem = updatedCart[event.index]
            .copyWith(quantity: updatedCart[event.index].quantity - 1);
        updatedCart[event.index] = updatedItem;
      }
      emit(CartState(updatedCart));
    });
  }
}
