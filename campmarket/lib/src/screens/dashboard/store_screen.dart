import 'package:flutter/material.dart';
import 'main_navigation.dart'; // Ensure this import is present
import 'user_dashboard.dart'; // Import UserDashboard
import 'cart_screen.dart';    // Import CartScreen
import 'add_item_screen.dart'; // Import AddItemScreen
import 'profile_screen.dart'; // Import ProfileScreen

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store'),
        backgroundColor: const Color(0xFF4DE165),
      ),
      body: Center(
        child: const Text(
          'Welcome to the store!',
          style: TextStyle(fontSize: 24, color: Colors.red), // Optional styling
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: 1, // Set the index for the Store screen
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          // Handle navigation based on the selected index
          if (index != 1) {
            // Navigate to the selected screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                switch (index) {
                  case 0:
                    return const UserDashboard(); // Home
                  case 2:
                    return const AddItemScreen(); // Add Item
                  case 3:
                    return const CartScreen(); // Cart
                  case 4:
                    return const ProfileScreen(); // Profile
                  default:
                    return const StoreScreen(); // Stay on Store
                }
              }),
            );
          }
        },
      ),
    );
  }
}
