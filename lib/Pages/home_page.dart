import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Pages/cart_page.dart';
import 'package:shop_app/Pages/search_page.dart';
import 'package:shop_app/Pages/setting_page.dart';
import 'package:shop_app/Widgets/product_list.dart';
import 'package:shop_app/Providers/cart_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = const [
    ProductList(),
    CartPage(),
    SearchPage(),
    SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();

    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.amber,
        iconSize: 35,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              label: Text(
                cartProvider.itemCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                ),
              ),
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            ),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            label: 'Search',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
