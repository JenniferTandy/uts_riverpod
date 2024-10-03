import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final Map<String, String> product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Image.asset(product['image']!,
                    height: 200, fit: BoxFit.cover)),
            SizedBox(height: 16),
            Text(
              product['name']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              product['brand']!,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              product['weight']!,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text(
              product['description']!,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
