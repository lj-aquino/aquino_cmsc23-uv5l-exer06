import 'package:flutter/material.dart';
import '../model/Item.dart'; // Importing the Item model
import 'package:provider/provider.dart';
import '../provider/shoppingcart_provider.dart'; // Importing the ShoppingCart provider

class MyCatalog extends StatefulWidget {
  const MyCatalog({super.key});

  @override
  State<MyCatalog> createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  // List of products available in the catalog
  List<Item> productsCatalog = [
    Item("Shampoo", 10.00, 2),
    Item("Soap", 12, 3),
    Item("Toothpaste", 40, 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Catalog")), // AppBar with title "My Catalog"
      body: ListView.builder(
        // Display products in a ListView
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const Icon(Icons.star), // Leading icon for each product
            title: Text(
              "${productsCatalog[index].name} - ${productsCatalog[index].price}", // Display product name and price
            ),
            trailing: TextButton(
              child: const Text("Add"), // Button to add product to cart
              onPressed: () {
                context.read<ShoppingCart>().addItem(productsCatalog[index]); // Add product to cart
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("${productsCatalog[index].name} added!"), // Show snackbar with added product's name
                  duration: const Duration(seconds: 1, milliseconds: 100),
                ));
              },
            ),
          );
        },
        itemCount: productsCatalog.length, // Number of products in the catalog
      ),
      floatingActionButton: FloatingActionButton(
        // Floating action button to navigate to the cart
        child: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.pushNamed(context, "/cart"); // Navigate to cart screen
        },
      ),
    );
  }
}
