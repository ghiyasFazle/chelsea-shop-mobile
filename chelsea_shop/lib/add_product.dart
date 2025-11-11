import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _thumbnailController = TextEditingController();
  String _category = 'scarves';
  bool _isSale = false;

  final List<Map<String, String>> _categories = [
    {'value': 'scarves', 'label': 'Scarves'},
    {'value': 'socks', 'label': 'Socks'},
    {'value': 'accessories', 'label': 'Accessories'},
    {'value': 'away', 'label': 'Away Jersey'},
    {'value': 'home', 'label': 'Home Jersey'},
    {'value': 'third', 'label': 'Third Jersey'},
    {'value': 'badges', 'label': 'Badges'},
  ];

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Produk Berhasil Disimpan'),
          content: Text(
            'Nama: ${_nameController.text}\n'
            'Harga: ${_priceController.text}\n'
            'Deskripsi: ${_descriptionController.text}\n'
            'Stok: ${_stockController.text}\n'
            'Kategori: $_category\n'
            'Thumbnail: ${_thumbnailController.text}\n'
            'Sedang Diskon: ${_isSale ? "Ya" : "Tidak"}',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  bool _isValidURL(String url) {
    final Uri? uri = Uri.tryParse(url);
    return uri != null && (uri.isAbsolute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk Baru'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Chelsea Shop Menu',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Halaman Utama'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_box),
              title: const Text('Tambah Produk'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/add-product');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  if (value.length < 3) {
                    return 'Nama minimal 3 karakter';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harga tidak boleh kosong';
                  }
                  final int? price = int.tryParse(value);
                  if (price == null || price < 0) {
                    return 'Harga harus angka positif';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Deskripsi tidak boleh kosong';
                  }
                  if (value.length < 10) {
                    return 'Deskripsi minimal 10 karakter';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _stockController,
                decoration: const InputDecoration(labelText: 'Stock'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Stok tidak boleh kosong';
                  }
                  final int? stock = int.tryParse(value);
                  if (stock == null || stock < 0) {
                    return 'Stok harus angka positif';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                value: _category,
                items: _categories
                    .map(
                      (cat) => DropdownMenuItem(
                        value: cat['value'],
                        child: Text(cat['label']!),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _category = value!;
                  });
                },
                decoration: const InputDecoration(labelText: 'Category'),
              ),
              TextFormField(
                controller: _thumbnailController,
                decoration: const InputDecoration(labelText: 'Thumbnail (URL)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'URL tidak boleh kosong';
                  }
                  if (!_isValidURL(value)) {
                    return 'Masukkan URL yang valid';
                  }
                  return null;
                },
              ),
              SwitchListTile(
                title: const Text('Is Sale'),
                value: _isSale,
                onChanged: (value) {
                  setState(() {
                    _isSale = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _showDialog();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
