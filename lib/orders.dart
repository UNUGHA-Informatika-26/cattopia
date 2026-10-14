import 'package:flutter/material.dart';

import 'cart.dart';
import 'grooming_detail_page.dart';

class OrderLine {
  final String nama;
  final int harga;
  final int jumlah;
  OrderLine(this.nama, this.harga, this.jumlah);
}

class ShopOrder {
  final String id;
  final List<OrderLine> items;
  final int total;
  final DateTime createdAt;
  ShopOrder({
    required this.id,
    required this.items,
    required this.total,
    required this.createdAt,
  });
}

class GroomingOrder {
  final String id;
  final GroomingPackage paket;
  final DateTime tanggal;
  final String jam;
  final DateTime createdAt;
  GroomingOrder({
    required this.id,
    required this.paket,
    required this.tanggal,
    required this.jam,
    required this.createdAt,
  });
}

final ValueNotifier<List<ShopOrder>> shopOrders = ValueNotifier([]);
final ValueNotifier<List<GroomingOrder>> groomingOrders = ValueNotifier([]);

int _seq = 0;
String _nextId() => 'ODR-${DateTime.now().millisecondsSinceEpoch}-${_seq++}';

void addShopOrder(List<CartItem> items) {
  if (items.isEmpty) return;
  final lines = items
      .map((e) => OrderLine(e.product.nama, e.product.harga, e.jumlah))
      .toList();
  final total =
      lines.fold<int>(0, (sum, e) => sum + e.harga * e.jumlah);
  final order = ShopOrder(
    id: _nextId(),
    items: lines,
    total: total,
    createdAt: DateTime.now(),
  );
  shopOrders.value = [...shopOrders.value, order];
}

void addGroomingOrder(GroomingPackage paket, DateTime tanggal, String jam) {
  final order = GroomingOrder(
    id: _nextId(),
    paket: paket,
    tanggal: tanggal,
    jam: jam,
    createdAt: DateTime.now(),
  );
  groomingOrders.value = [...groomingOrders.value, order];
}