import 'package:flutter/material.dart';
import 'home_page.dart';
import 'products.dart';
import 'cart.dart';

class DetailPage extends StatefulWidget {
  final Product product;
  const DetailPage({super.key, required this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int jumlah = 1;

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    final total = p.harga * jumlah;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOrange,
        foregroundColor: Colors.white,
        title: const Text('Detail Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.pets, size: 80, color: kOrange),
            ),
            const SizedBox(height: 16),
            Text(
              p.nama,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'Rp ${p.harga}',
              style: const TextStyle(
                fontSize: 18,
                color: kOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text('Kategori: ${p.kategori}'),
            const SizedBox(height: 16),
            const Text(
              'Deskripsi Produk',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Produk berkualitas untuk kucing kesayangan Anda. Ambil di toko setelah pesanan siap.',
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Jumlah',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (jumlah > 1) setState(() => jumlah--);
                      },
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    Text('$jumlah', style: const TextStyle(fontSize: 16)),
                    IconButton(
                      onPressed: () => setState(() => jumlah++),
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Pesanan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp $total',
                  style: const TextStyle(
                    color: kOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(backgroundColor: kOrange),
                onPressed: () {
                  addToCart(p, jumlah);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Produk masuk keranjang')),
                  );
                  Navigator.pop(context);
                },
                child: const Text('Masukkan Keranjang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
