import 'package:flutter/material.dart';

import 'home_page.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            width: double.infinity,
            color: kOrange,
            padding: const EdgeInsets.all(16),
            child: const Text(
              'Profil',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: CircleAvatar(
              radius: 44,
              backgroundColor: Colors.orange.shade100,
              child: const Icon(Icons.person, size: 48, color: kOrange),
            ),
          ),
          const SizedBox(height: 12),
          const Center(
            child: Text(
              'Pengguna Cattopia',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Center(
            child: Text(
              'member@cattopia.id',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 20),
          _infoTile(Icons.phone, 'Nomor HP', '+62 812-0000-0000'),
          _infoTile(Icons.location_on, 'Alamat', 'Purwokerto, Jawa Tengah'),
          _infoTile(Icons.pets, 'Anabul', '1 kucing (Milo)'),
          const SizedBox(height: 12),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.edit, color: kOrange),
                  title: const Text('Edit Profil'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Fitur edit profil belum aktif')),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.notifications, color: kOrange),
                  title: const Text('Notifikasi'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline, color: kOrange),
                  title: const Text('Tentang Aplikasi'),
                  subtitle: const Text('Cattopia v1.0.0'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text('Keluar'),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Keluar (demo)')),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String label, String value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: kOrange),
        title: Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        subtitle: Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}