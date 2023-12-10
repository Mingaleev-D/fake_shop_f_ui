import 'package:fake_shop_f_ui/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'card_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = const [
    ProductListWidget(),
    CardPageWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 25,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          currentIndex: currentPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: ''),
          ],
        ),
        body: IndexedStack(index: currentPage, children: pages),
      ),
    );
  }
}
