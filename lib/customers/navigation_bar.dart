import 'package:flutter/material.dart';
import 'package:petra_final/customers/all_customers_screen.dart';
import 'package:petra_final/customers/fetch_customer.dart';

class bottom_bar extends StatefulWidget {
  const bottom_bar({Key key}) : super(key: key);

  @override
  _bottom_barState createState() => _bottom_barState();
}

class _bottom_barState extends State<bottom_bar> {
  int currentIndex = 0;
  final screens = [
    fetch_screen(),
    AllCustomersScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        selectedItemColor: Color.fromRGBO(56, 124, 255,1),
        unselectedItemColor: Color.fromRGBO(215, 220, 228,1),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(()  => currentIndex = index),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'all & create',
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.account_balance_wallet,
          ),
            label: 'Orders',
          ),
        ],
      ),
    );
  }
}

