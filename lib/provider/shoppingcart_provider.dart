import 'package:flutter/material.dart';
import '../model/Item.dart'; // Importing the Item model

// ShoppingCart class responsible for managing the shopping cart state
class ShoppingCart with ChangeNotifier {
  final List<Item> _shoppingList = []; // List to hold items in the shopping cart
  double cartTotal = 0; // Variable to keep track of the total cost of items in the cart

  // Getter to access the shopping cart items
  List<Item> get cart => _shoppingList;

  // Method to add an item to the shopping cart
  void addItem(Item item) {
    _shoppingList.add(item); // Add the item to the cart
    cartTotal += item.price; // Update the total cost
    notifyListeners(); // Notify listeners (typically widgets) that the state has changed
  }

  // Method to remove all items from the shopping cart
  void removeAll() {
    _shoppingList.clear(); // Clear the shopping cart
    cartTotal = 0; // Reset the total cost
    notifyListeners(); // Notify listeners of the state change
  }

  // Method to remove a specific item from the shopping cart based on its name
  void removeItem(String name) {
    for (int i = 0; i < _shoppingList.length; i++) {
      if (_shoppingList[i].name == name) { // Find the item with the specified name
        cartTotal -= _shoppingList[i].price; // Deduct the item's cost from the total
        _shoppingList.remove(_shoppingList[i]); // Remove the item from the cart
        break; // Exit the loop after removing the first occurrence of the item
      }
    }
    notifyListeners(); // Notify listeners of the state change
  }
}
