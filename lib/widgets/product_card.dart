import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String product;
  final String image;
  final String brand;
  final String weight;
  final bool isAdded;
  final VoidCallback addToCart;

  const ProductCard({
    Key? key,
    required this.product,
    required this.image,
    required this.brand,
    required this.weight,
    required this.isAdded,
    required this.addToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 100, fit: BoxFit.cover),
            SizedBox(height: 8),
            Text(
              product,
            ),
            SizedBox(height: 4),
            SizedBox(height: 8), // Menambahkan jarak sebelum tombol
            isAdded
                ? Text(
                    'Added to Cart',
                    style: TextStyle(color: Colors.green),
                  )
                : ElevatedButton(
                    onPressed: addToCart,
                    child: Text('Add to Cart'),
                  ),
          ],
        ),
      ),
    );
  }
}
