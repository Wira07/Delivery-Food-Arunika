import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/pages/Profile.dart';
import 'package:fooddelivery/pages/home.dart';
import 'package:fooddelivery/pages/order.dart';
import 'package:fooddelivery/pages/wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Home homepage;
  late Profile profile;
  late Order order;
  late Wallet wallet;

  @override
  void initState() {
    super.initState();
    homepage = const Home();
    order = const Order();
    profile = const Profile();
    wallet = const Wallet();
    pages = [homepage, order, wallet, profile];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentTabIndex], // Menampilkan halaman berdasarkan indeks
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index; // Mengubah indeks tab saat ditekan
          });
        },
        items: const [
          Icon(
            Icons.home_outlined,
            color: Colors.white, // Warna ikon diubah menjadi putih
          ),
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white, // Warna ikon diubah menjadi putih
          ),
          Icon(
            Icons.wallet_outlined,
            color: Colors.white, // Warna ikon diubah menjadi putih
          ),
          Icon(
            Icons.person_outline,
            color: Colors.white, // Warna ikon diubah menjadi putih
          ),
        ],
      ),
    );
  }
}
