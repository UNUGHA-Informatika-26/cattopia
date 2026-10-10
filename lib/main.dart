import 'package:flutter/material.dart';

import 'home_page.dart';
import 'shop_page.dart';

void main() {
  runApp(const CattopiaApp());
}

class CattopiaApp extends StatelessWidget {
  const CattopiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cattopia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFFF2A93B),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  final List<Widget> _pages = const [
    HomePage(),
    ShopPage(),
    Center(child: Text('Grooming')),
    Center(child: Text('Pesanan')),
    Center(child: Text('Profil')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Pet Shop',
          ),
          NavigationDestination(icon: Icon(Icons.pets), label: 'Grooming'),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Pesanan',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
