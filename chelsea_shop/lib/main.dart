import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'screens/menu.dart';
import 'screens/login.dart';
import 'screens/product_form.dart';

void main() {
  runApp(const ChelseaShopApp());
}

class ChelseaShopApp extends StatelessWidget {
  const ChelseaShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<CookieRequest>(
      create: (_) => CookieRequest(),
      child: MaterialApp(
        title: 'Chelsea Shop',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),

        // ✔ Setelah login, user diarahkan ke MenuPage
        initialRoute: '/login',

        routes: {
          '/login': (context) => const LoginPage(),
          '/': (context) => const MenuPage(),

          // ✔ Ganti ke ProductFormPage
          '/add-product': (context) => const ProductFormPage(),
        },
      ),
    );
  }
}
