import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';

/// Represents a single line item in the cart.
class CartItem {
  final Product product;
  final int quantity;

  const CartItem({required this.product, required this.quantity});

  CartItem copyWith({int? quantity}) {
    return CartItem(
      product: product,
      quantity: quantity ?? this.quantity,
    );
  }

  double get totalPrice => product.price * quantity;
}

/// Holds cart state as a map of productId -> CartItem for O(1) lookups.
class CartNotifier extends StateNotifier<Map<String, CartItem>> {
  CartNotifier() : super({});

  void addProduct(Product product) {
    final existing = state[product.id];
    if (existing != null) {
      state = {
        ...state,
        product.id: existing.copyWith(quantity: existing.quantity + 1),
      };
    } else {
      state = {
        ...state,
        product.id: CartItem(product: product, quantity: 1),
      };
    }
  }

  void removeProduct(Product product) {
    final existing = state[product.id];
    if (existing == null) return;
    if (existing.quantity <= 1) {
      final newState = {...state};
      newState.remove(product.id);
      state = newState;
    } else {
      state = {
        ...state,
        product.id: existing.copyWith(quantity: existing.quantity - 1),
      };
    }
  }

  int quantityOf(String productId) => state[productId]?.quantity ?? 0;

  void clear() => state = {};
}

final cartProvider =
    StateNotifierProvider<CartNotifier, Map<String, CartItem>>((ref) {
  return CartNotifier();
});

/// Derived provider: total number of items (sum of quantities) in the cart.
final cartItemCountProvider = Provider<int>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.values.fold(0, (sum, item) => sum + item.quantity);
});

/// Derived provider: total cart price.
final cartTotalProvider = Provider<double>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.values.fold(0.0, (sum, item) => sum + item.totalPrice);
});
