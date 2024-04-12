import 'package:flutter/material.dart';
import '../model/Item.dart'; // Importing the Item model
import 'package:provider/provider.dart';
import '../provider/shoppingcart_provider.dart'; // Importing the ShoppingCart provider

// MyCart widget responsible for displaying the items in the cart and providing options to reset or checkout
class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")), // AppBar with title "My Cart"
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getItems(context), // Display cart items
          const Divider(height: 4, color: Colors.black), // Divider line
          Flexible(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<ShoppingCart>().removeAll(); // Reset the cart
                    },
                    child: const Text("Reset"), // Button text
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/checkout"); // Navigate to checkout screen
                    },
                    child: const Text("Checkout"), // Button text
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            child: const Text("Go back to Product Catalog"), // Button to navigate back to product catalog
            onPressed: () {
              Navigator.pushNamed(context, "/products");
            },
          ),
        ],
      ),
    );
  }

  // Function to display items in the cart
  Widget getItems(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart; // Get the list of items from the cart
    String productname = ""; // Variable to store the name of the product being removed
    return products.isEmpty // Check if the cart is empty
        ? const Text('No Items yet!') // Display message if cart is empty
        : Expanded( // Display items if cart is not empty
            child: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: const Icon(Icons.food_bank), // Icon for each item
                        title: Text(products[index].name), // Display item name
                        trailing: IconButton(
                          icon: const Icon(Icons.delete), // Delete icon
                          onPressed: () {
                            productname = products[index].name; // Store the name of the product being removed
                            context.read<ShoppingCart>().removeItem(productname); // Remove the product from the cart
                            if (products.isNotEmpty) { // Show a snackbar with the removed product's name
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("$productname removed!"),
                                  duration: const Duration(seconds: 1, milliseconds: 100),
                                ),
                              );
                            } else { // Show a snackbar if the cart is empty after removal
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Cart Empty!"),
                                  duration: Duration(seconds: 1, milliseconds: 100),
                                ),
                              );
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
