import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFFDFBF9);
    const border = Color(0xFF8B5E3C);
    const listBg = Color(0xFFEFE5DC);

    final images = [
      'assets/images/peem1.jpg',
      'assets/images/peem2.jpg',
      'assets/images/peem3.jpg',
      'assets/images/peem4.jpg',
      'assets/images/peem5.jpg',
      'assets/images/peem6.jpg',
    ];

    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: bg,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFBFAE9F),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('MY FLUTTER APP')),
        body: CustomScrollView(
          slivers: [
            _title('PEEMWASU BUS', border),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid.builder(
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
                itemBuilder: (context, i) => ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(images[i], fit: BoxFit.cover),
                ),
              ),
            ),
            _title('รายการสินค้า', border),
            SliverList.builder(
              itemCount: 10,
              itemBuilder: (context, i) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: listBg,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: border),
                ),
                child: ListTile(
                  leading: const Icon(Icons.favorite_outline),
                  title: Text('List Item ${i + 1}'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title(String text, Color color) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
              letterSpacing: 1.2,
            ),
          ),
        ),
      );
}
