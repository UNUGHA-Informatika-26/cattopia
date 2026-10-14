import 'package:flutter/material.dart';

import 'home_page.dart';
import 'orders.dart';

String _fmtDate(DateTime d) => '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';
String _fmtTime(DateTime d) =>
    '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';

class PesananPage extends StatelessWidget {
  const PesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kOrange,
          foregroundColor: Colors.white,
          title: const Text('Pesanan'),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: 'Produk'),
              Tab(text: 'Grooming'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _ShopOrderList(),
            _GroomingOrderList(),
          ],
        ),
      ),
    );
  }
}

class _ShopOrderList extends StatelessWidget {
  const _ShopOrderList();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<ShopOrder>>(
      valueListenable: shopOrders,
      builder: (context, orders, _) {
        if (orders.isEmpty) {
          return const Center(child: Text('Belum ada pesanan produk'));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: orders.length,
          itemBuilder: (context, i) {
            final o = orders[orders.length - 1 - i];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          o.id,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '${_fmtDate(o.createdAt)} ${_fmtTime(o.createdAt)}',
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    const Divider(),
                    ...o.items.map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text('${e.nama} x${e.jumlah}')),
                            Text('Rp ${e.harga * e.jumlah}'),
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          'Rp ${o.total}',
                          style: const TextStyle(
                            color: kOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _GroomingOrderList extends StatelessWidget {
  const _GroomingOrderList();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<GroomingOrder>>(
      valueListenable: groomingOrders,
      builder: (context, orders, _) {
        if (orders.isEmpty) {
          return const Center(child: Text('Belum ada booking grooming'));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: orders.length,
          itemBuilder: (context, i) {
            final o = orders[orders.length - 1 - i];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          o.id,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '${_fmtDate(o.createdAt)} ${_fmtTime(o.createdAt)}',
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      o.paket.nama,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text('Jadwal: ${_fmtDate(o.tanggal)} pukul ${o.jam}'),
                    const SizedBox(height: 4),
                    Text('Total: Rp ${o.paket.harga}', style: const TextStyle(color: kOrange)),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}