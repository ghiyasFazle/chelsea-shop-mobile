import 'package:flutter/material.dart';
import 'package:chelsea_shop/widget/product_card.dart';
import 'package:chelsea_shop/widget/left_drawer.dart';
import 'package:chelsea_shop/screens/product_form.dart';
import 'package:chelsea_shop/screens/product_entry_list.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chelsea Shop"), centerTitle: true),

      drawer: const LeftDrawer(),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// === SEE PRODUCTS ===
            ProductCard(
              name: "See Products",
              icon: Icons.store,
              color: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductEntryListPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            /// === MY PRODUCTS ===
            ProductCard(
              name: "My Products",
              icon: Icons.shopping_bag,
              color: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ProductEntryListPage(myProducts: true),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            /// === CREATE PRODUCT ===
            ProductCard(
              name: "Create Product",
              icon: Icons.add_circle,
              color: Colors.red,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductFormPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
