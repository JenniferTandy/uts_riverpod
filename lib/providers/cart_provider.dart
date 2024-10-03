import 'package:flutter_riverpod/flutter_riverpod.dart';

// Model untuk CartItem
class CartItem {
  String productName;
  String productImage;
  int quantity;

  CartItem({
    required this.productName,
    required this.productImage,
    this.quantity = 1,
  });
}

// Notifier untuk Cart
class CartController extends StateNotifier<List<CartItem>> {
  CartController() : super([]);

  // Mendapatkan total item di keranjang
  int get totalItems => state.fold(0, (sum, item) => sum + item.quantity);

  // Menambah produk ke keranjang
  void addToCart(String product, String image) {
    // Mencari apakah produk sudah ada di keranjang
    final index = state.indexWhere((item) => item.productName == product);

    if (index != -1) {
      // Jika produk sudah ada, tambahkan quantity
      state = state.map((item) {
        if (item.productName == product) {
          return CartItem(
            productName: item.productName,
            productImage: item.productImage,
            quantity: item.quantity + 1,
          );
        }
        return item;
      }).toList();
    } else {
      // Jika produk belum ada, tambahkan produk baru
      state = [
        ...state,
        CartItem(productName: product, productImage: image),
      ];
    }
  }

  // Menghapus produk dari keranjang
  void removeProduct(String product) {
    state = state.where((item) => item.productName != product).toList();
  }

  // Menambah quantity produk
  void increaseQuantity(String product) {
    state = state.map((item) {
      if (item.productName == product) {
        return CartItem(
          productName: item.productName,
          productImage: item.productImage,
          quantity: item.quantity + 1,
        );
      }
      return item;
    }).toList();
  }

  // Mengurangi quantity produk
  void decreaseQuantity(String product) {
    state = state.map((item) {
      if (item.productName == product && item.quantity > 1) {
        return CartItem(
          productName: item.productName,
          productImage: item.productImage,
          quantity: item.quantity - 1,
        );
      }
      return item;
    }).toList();
  }
}

// Provider untuk CartController
final cartProvider =
    StateNotifierProvider<CartController, List<CartItem>>((ref) {
  return CartController();
});
