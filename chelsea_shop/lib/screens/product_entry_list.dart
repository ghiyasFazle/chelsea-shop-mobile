import 'package:flutter/material.dart';
import 'package:chelsea_shop/models/product_entry.dart';
import 'package:chelsea_shop/widget/product_entry_card.dart';
import 'package:chelsea_shop/screens/product_detail.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  final bool myProducts;

  const ProductEntryListPage({super.key, this.myProducts = false});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    final response = await request.get("http://localhost:8000/json/");

    List<ProductEntry> products = [];
    for (var d in response) {
      if (d != null) {
        products.add(ProductEntry.fromJson(d));
      }
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.myProducts ? "My Products" : "Chelsea Shop Products",
        ),
      ),

      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "There are no products available yet.",
                style: TextStyle(fontSize: 20, color: Colors.blueGrey),
              ),
            );
          }

          List<ProductEntry> products = snapshot.data!;

          // =====================================================
          // FILTER KHUSUS “MY PRODUCTS”
          // =====================================================
          if (widget.myProducts) {
            final int loggedInUserId = request.jsonData["id"];

            products = products
                .where((p) => p.userId == loggedInUserId)
                .toList();
          }

          if (products.isEmpty) {
            return const Center(
              child: Text(
                "No products found for this user.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (_, index) {
              final product = products[index];

              return ProductEntryCard(
                product: product,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(product: product),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
