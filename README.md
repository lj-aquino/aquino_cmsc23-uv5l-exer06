# Lyka Joyce M. Aquino

## Degree Program: 
Bachelor of Science in Computer Science

## Project Overview
This project involves developing a checkout feature for a Flutter application that simulates a shopping cart system. The application is structured to manage a catalog of products, add items to a shopping cart, and proceed to a checkout screen where the user can finalize their purchases.

## Key Features
- **Product Catalog**: Displays a list of available products which users can add to their shopping cart.
- **Shopping Cart**: Users can view their selected items, remove items, or reset the cart entirely.
- **Checkout Process**: When items are in the cart, users can proceed to the checkout screen where the total price is calculated, and a payment can be made.

## Implementation Details

### File Structure
- `Item.dart`: Defines the `Item` class with properties for name, price, and quantity.
- `shoppingcart_provider.dart`: Manages the shopping cart logic using a provider pattern. It allows adding, removing, and clearing items.
- `MyCart.dart`: A screen that displays the cart items and provides options to manage them.
- `MyCatalog.dart`: Displays the catalog of products and includes functionality to add items to the cart.
- `Checkout.dart`: Handles the checkout process, displaying the total cost and a "Pay Now" button.

### Checkout Screen
The checkout screen is designed to:
- List items in the cart with their prices.
- Display the total cost at the bottom of the screen.
- Include a "Pay Now" button which, when clicked, clears the cart and displays a "Payment Successful" message.

### Special Considerations
- The "Pay Now" button is only enabled when there are items in the cart. If the cart is empty, a message "No items to checkout" is displayed instead.
- The shopping cart uses the Provider package for state management, ensuring that changes to the cart are reflected across the entire application without requiring a reload.

## Usage
To navigate through the application:
1. Start from the product catalog.
2. Add items to the cart.
3. Go to the cart to modify it or proceed to checkout.
4. In the checkout screen, finalize the purchase or return to the catalog.

## Conclusion
This project showcases the implementation of a basic shopping cart and checkout system within a Flutter application, demonstrating the use of state management, navigation, and UI components in a real-world scenario.
