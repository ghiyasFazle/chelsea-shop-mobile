import 'package:flutter/material.dart';
import 'menu.dart';
import 'add_product.dart';

void main() {
  runApp(const ChelseaShopApp());
}

class ChelseaShopApp extends StatelessWidget {
  const ChelseaShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chelsea Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MenuPage(),
        '/add-product': (context) => const AddProductPage(),
      },
    );
  }
}
