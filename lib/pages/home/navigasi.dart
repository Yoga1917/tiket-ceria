import 'package:bottom_nav_layout/bottom_nav_layout.dart';
import 'package:flutter/material.dart';
import 'package:tiket_ceria/pages/home/beranda.dart';
import 'package:tiket_ceria/pages/home/profil.dart';
import 'package:tiket_ceria/pages/home/tiket.dart';
import 'package:tiket_ceria/pages/home/transaksi.dart';

class NavigasiPage extends StatefulWidget {
  const NavigasiPage({super.key, required child});

  @override
  State<NavigasiPage> createState() => _NavigasiPageState();
}

class _NavigasiPageState extends State<NavigasiPage> {
  @override
  Widget build(BuildContext context) {
    return BottomNavLayout(
      pages: [
        (_) => BerandaPage(),
        (_) => TransaksiPage(),
        (_) => TiketPage(),
        (_) => ProfilePage(),
      ],
      bottomNavigationBar: (currentIndex, onTap) => BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => onTap(index),
        selectedItemColor: Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.work_history_rounded), label: 'Transaksi'),
          BottomNavigationBarItem(
              icon: Icon(Icons.article_sharp), label: 'Tiket'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profil'),
        ],
      ),
      savePageState: false,
      lazyLoadPages: false,
      pageStack: ReorderToFrontPageStack(initialPage: 0),
      extendBody: false,
      resizeToAvoidBottomInset: true,
      pageTransitionData: null,
    );
  }
}
