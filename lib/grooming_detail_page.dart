import 'package:flutter/material.dart';

import 'home_page.dart';

class GroomingPackage {
  final String nama;
  final int harga;
  final String deskripsi;
  final List<String> isi;
  const GroomingPackage(this.nama, this.harga, this.deskripsi, this.isi);
}

class GroomingDetailPage extends StatefulWidget {
  final GroomingPackage paket;
  const GroomingDetailPage({super.key, required this.paket});

  @override
  State<GroomingDetailPage> createState() => _GroomingDetailPageState();
}

class _GroomingDetailPageState extends State<GroomingDetailPage> {
  DateTime? tanggal;
  String? jam;
  final jamList = ['09:00', '10:00', '11:00', '13:00', '14:00', '15:00'];

  String formatTanggal(DateTime d) => '${d.day}/${d.month}/${d.year}';

  Future<void> pilihTanggal() async {
    final hasil = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 60)),
    );
    if (hasil != null) setState(() => tanggal = hasil);
  }

  void konfirmasi() {
    if (tanggal == null || jam == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pilih tanggal dan jam dulu')),
      );
      return;
    }
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Konfirmasi Pemesanan'),
        content: Text(
          '${widget.paket.nama}\nJadwal: ${formatTanggal(tanggal!)} pukul $jam\nTotal: Rp ${widget.paket.harga}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Ubah Jadwal'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: kOrange),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Booking grooming berhasil')),
              );
            },
            child: const Text('Konfirmasi'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.paket;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOrange,
        foregroundColor: Colors.white,
        title: const Text('Detail Grooming'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Icon(Icons.pets, size: 70, color: kOrange),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            p.nama,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Rp ${p.harga}',
            style: const TextStyle(
              fontSize: 18,
              color: kOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(p.deskripsi),
          const SizedBox(height: 16),
          const Text(
            'Apa saja yang termasuk?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ...p.isi.map(
            (e) => ListTile(
              dense: true,
              leading: const Icon(Icons.check_circle, color: kOrange),
              title: Text(e),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Pilih Jadwal',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: pilihTanggal,
            icon: const Icon(Icons.calendar_month),
            label: Text(
              tanggal == null ? 'Pilih tanggal' : formatTanggal(tanggal!),
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: jamList
                .map(
                  (j) => ChoiceChip(
                    label: Text(j),
                    selected: jam == j,
                    onSelected: (_) => setState(() => jam = j),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 20),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: kOrange),
            onPressed: konfirmasi,
            child: const Text('Pilih Jadwal Grooming'),
          ),
        ],
      ),
    );
  }
}
