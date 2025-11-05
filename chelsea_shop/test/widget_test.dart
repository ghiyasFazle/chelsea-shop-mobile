import 'package:flutter_test/flutter_test.dart';
import 'package:chelsea_shop/main.dart';

void main() {
  testWidgets('Memastikan tombol-tombol tampil dan dapat ditekan', (
    WidgetTester tester,
  ) async {
    // Membangun widget utama aplikasi
    await tester.pumpWidget(const ChelseaShopApp());

    // Memastikan ketiga tombol tampil
    expect(find.text('All Products'), findsOneWidget);
    expect(find.text('My Products'), findsOneWidget);
    expect(find.text('Create Product'), findsOneWidget);

    // Tekan tombol All Products
    await tester.tap(find.text('All Products'));
    await tester.pump(); // Memicu SnackBar muncul
    expect(find.text('Kamu telah menekan tombol All Products'), findsOneWidget);

    // Tekan tombol My Products
    await tester.tap(find.text('My Products'));
    await tester.pump();
    expect(find.text('Kamu telah menekan tombol My Products'), findsOneWidget);

    // Tekan tombol Create Product
    await tester.tap(find.text('Create Product'));
    await tester.pump();
    expect(
      find.text('Kamu telah menekan tombol Create Product'),
      findsOneWidget,
    );
  });
}
