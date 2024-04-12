import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/shoppingcart_provider.dart';
import '../model/Item.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<ShoppingCart>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: cart.cart.isNotEmpty ? Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.cart.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(cart.cart[index].name),
                subtitle: Text("\$${cart.cart[index].price.toStringAsFixed(2)}"),
              ),
            ),
          ),
          const Divider(),
          Text(
            "Total: \$${cart.cartTotal.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              cart.removeAll();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Payment Successful")),
              );
            },
            child: const Text("Pay Now"),
          ),
        ],
      ) : const Center(
        child: Text(
          "No items to checkout",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
