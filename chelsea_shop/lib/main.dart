import 'package:flutter/material.dart';
import 'menu.dart';

void main() {
  runApp(const ChelseaShopApp());
}

class ChelseaShopApp extends StatelessWidget {
  const ChelseaShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chelsea Shop',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const MenuPage(),
    );
  }
}
