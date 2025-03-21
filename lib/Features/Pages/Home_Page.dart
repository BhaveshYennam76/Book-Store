import 'package:flutter/material.dart';
import 'package:spotify_library/Features/Pages/Cart.dart';
import 'package:spotify_library/Features/Pages/Products.dart';

import '../../Core/Constants/Colors.dart';
import '../../utils/Indexes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = MyIndexes.NavigationIndex;

  final List<Widget> _pages = [ Cart(),Product(),];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffbfbfb),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xffffffff),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.primaryColor,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
        unselectedItemColor: const Color(0xff9f9fb5),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon:
                _selectedIndex == 0
                    ? const Icon(Icons.home)
                    : const Icon(Icons.home_outlined),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon:
                _selectedIndex == 1
                    ? const Icon(Icons.shopping_cart_sharp)
                    : const Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
