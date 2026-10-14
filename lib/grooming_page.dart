import 'package:flutter/material.dart';

import 'home_page.dart';
import 'grooming_detail_page.dart';

const paketList = [
  GroomingPackage(
    'Paket Grooming Basic',
    120000,
    'Paket grooming basic ini terdiri dari mandi, potong kuku, dan perawatan bulu biasa.',
    ['Mandi', 'Potong kuku', 'Perawatan bulu biasa'],
  ),
  GroomingPackage(
    'Paket Grooming Maksimal',
    220000,
    'Paket grooming lengkap dengan mandi, potong kuku, serta perawatan bulu maksimal untuk anabul kamu.',
    ['Mandi', 'Potong kuku', 'Perawatan bulu maksimal'],
  ),
];

class GroomingPage extends StatelessWidget {
  const GroomingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: kOrange,
            padding: const EdgeInsets.all(16),
            child: const Text(
              'Grooming',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: paketList.length,
              itemBuilder: (context, i) {
                final p = paketList[i];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GroomingDetailPage(paket: p),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.orange.shade50,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.pets,
                              size: 50,
                              color: kOrange,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            p.nama,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(p.deskripsi),
                          const SizedBox(height: 8),
                          Text(
                            'Rp ${p.harga}',
                            style: const TextStyle(
                              color: kOrange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
