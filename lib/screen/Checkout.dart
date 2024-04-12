import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/shoppingcart_provider.dart'; // Importing the ShoppingCart provider
import '../model/Item.dart'; // Importing the Item model

// Checkout widget responsible for displaying the items in the cart and handling checkout process
class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<ShoppingCart>(context); // Accessing the ShoppingCart provider

    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")), // AppBar with title "Checkout"
      body: cart.cart.isNotEmpty ? Column( // Display cart items if cart is not empty
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.cart.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(cart.cart[index].name), // Display item name
                subtitle: Text("\$${cart.cart[index].price.toStringAsFixed(2)}"), // Display item price
              ),
            ),
          ),
          const Divider(), // Divider line
          Text(
            "Total: \$${cart.cartTotal.toStringAsFixed(2)}", // Display total cost
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Styling for total cost text
          ),
          const SizedBox(height: 20), // Empty space
          ElevatedButton(
            onPressed: () {
              cart.removeAll(); // Clear the cart on button press
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Payment Successful")), // Show payment successful message
              );
            },
            child: const Text("Pay Now"), // Button text
          ),
        ],
      ) : const Center( // Display message if cart is empty
        child: Text(
          "No items to checkout",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Styling for message
        ),
      ),
    );
  }
}
