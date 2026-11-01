import 'package:flutter/material.dart';
import '../widgets/header_card.dart';
import 'aim_screen.dart';
import 'hologram_screen.dart';
import 'skinmod_screen.dart';
import 'compatibility_screen.dart';
import 'more_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  final List<Widget> _screens = const [
    AimScreen(), HologramScreen(), SkinModScreen(),
    CompatibilityScreen(), MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A14),
      body: Column(
        children: [
          const SafeArea(child: SizedBox()),
          const HeaderCard(),
          Expanded(child: _screens[_index]),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF0D0D1A),
          border: Border(top: BorderSide(color: Color(0xFF1A1A2E))),
        ),
        child: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFFE31A1A),
          unselectedItemColor: Colors.white38,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.gps_fixed), label: 'AIM'),
            BottomNavigationBarItem(icon: Icon(Icons.view_in_ar), label: 'HOLOGRAM'),
            BottomNavigationBarItem(icon: Icon(Icons.auto_awesome), label: 'SKIN MOD'),
            BottomNavigationBarItem(icon: Icon(Icons.phone_iphone), label: 'COMPATIBILITY'),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
          ],
        ),
      ),
    );
  }
}
