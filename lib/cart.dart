import 'package:flutter/material.dart';

import 'products.dart';

class CartItem {
  final Product product;
  int jumlah;
  CartItem(this.product, this.jumlah);
}

// Isi keranjang (disimpan di memori selama aplikasi jalan)
final ValueNotifier<List<CartItem>> cart = ValueNotifier([]);

void addToCart(Product p, int jumlah) {
  final list = [...cart.value];
  final index = list.indexWhere((e) => e.product.nama == p.nama);
  if (index >= 0) {
    list[index].jumlah += jumlah;
  } else {
    list.add(CartItem(p, jumlah));
  }
  cart.value = list;
}

void removeFromCart(CartItem item) {
  cart.value = cart.value.where((e) => e != item).toList();
}

int cartTotal() {
  return cart.value.fold(0, (sum, e) => sum + e.product.harga * e.jumlah);
}
