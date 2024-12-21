import 'package:flutter/material.dart';
import 'main_navigation.dart'; // Ensure this import is present
import 'user_dashboard.dart'; // Import UserDashboard
import 'store_screen.dart';   // Import StoreScreen
import 'add_item_screen.dart'; // Import AddItemScreen
import 'profile_screen.dart'; // Import ProfileScreen
import 'exchange_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom Header
            _buildHeader(),

            const SizedBox(height: 20),

            // Category Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryButton(context, 'Rent', const UserDashboard()),
                _buildCategoryButton(context, 'Exchange', const UserDashboard()),
                _buildCategoryButton(context, 'Sell', const UserDashboard()),
                _buildCategoryButton(context, 'Tutoring', const UserDashboard()),
              ],
            ),

            const SizedBox(height: 20),

            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Cart Items Section
            const Text(
              'Items in Your Cart',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: [
                  _buildCartItem('Scientific Calculator', '₱10 per Hour', 'assets/images/calculator.jpg'),
                  _buildCartItem('Lab Gown', '₱20 per Hour', 'assets/images/lab_gown.jpg'),
                  // Add more cart items as needed
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF4DE165), // Header background color
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/images/logo.png', height: 40), // Replace with your logo path
              const SizedBox(width: 8),
              const Text(
                'Campus Marketing',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20, // Adjusted font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle Pro button action
                },
                child: const Text('Pro'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Adjusted padding
                ),
              ),
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () {
                  // Handle notification action
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(String title, String price, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(imagePath, height: 60, width: 60, fit: BoxFit.cover),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(price, style: const TextStyle(color: Colors.green)),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
              onPressed: () {
                // Handle remove item from cart
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, String text, Widget screen) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.store),
          label: 'Store',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline), // Add icon
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: 3, // Set the index for the Cart screen
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      onTap: (index) {
        // Handle navigation based on the selected index
        if (index != 3) {
          // Navigate to the selected screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) {
              switch (index) {
                case 0:
                  return const UserDashboard(); // Home
                case 1:
                  return const StoreScreen(); // Store
                case 2:
                  return const AddItemScreen(); // Add Item
                case 4:
                  return const ProfileScreen(); // Profile
                default:
                  return const CartScreen(); // Stay on Cart
              }
            }),
          );
        }
      },
    );
  }
}
