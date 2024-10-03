import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/cart_provider.dart';

class CartPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: cartItems.isEmpty
          ? Center(child: Text('No items in the cart'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: Image.asset(item.productImage, width: 50),
                  title: Text(item.productName),
                  subtitle: Text('Quantity: ${item.quantity}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          ref
                              .read(cartProvider.notifier)
                              .decreaseQuantity(item.productName);
                        },
                      ),
                      Text(item.quantity.toString()),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          ref
                              .read(cartProvider.notifier)
                              .increaseQuantity(item.productName);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Confirm Removal'),
                                content: Text(
                                    'Are you sure you want to remove "${item.productName}" from the cart?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('No'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      ref
                                          .read(cartProvider.notifier)
                                          .removeProduct(item.productName);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Yes'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
