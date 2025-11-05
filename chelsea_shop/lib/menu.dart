import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chelsea Shop'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: const Size(200, 50),
              ),
              icon: const Icon(Icons.store),
              label: const Text('All Products'),
              onPressed: () {
                _showSnackBar(
                  context,
                  'Kamu telah menekan tombol All Products',
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: const Size(200, 50),
              ),
              icon: const Icon(Icons.shopping_bag),
              label: const Text('My Products'),
              onPressed: () {
                _showSnackBar(context, 'Kamu telah menekan tombol My Products');
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: const Size(200, 50),
              ),
              icon: const Icon(Icons.add_circle),
              label: const Text('Create Product'),
              onPressed: () {
                _showSnackBar(
                  context,
                  'Kamu telah menekan tombol Create Product',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
