import 'package:flutter/material.dart';
import 'main_navigation.dart'; // Ensure this import is present
import 'user_dashboard.dart'; // Import UserDashboard
import 'cart_screen.dart';    // Import CartScreen
import 'store_screen.dart';   // Import StoreScreen
import 'add_item_screen.dart'; // Import AddItemScreen
import '../auth/login_screen.dart'; // Adjust the path to your LoginScreen

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFF4DE165),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://example.com/profile.jpg'), // Replace with actual image URL
            ),
            const SizedBox(height: 16),
            const Text('Sudai Alhad', style: TextStyle(fontSize: 24)),
            const Text('sudai.alhad@one.uz.edu.ph', style: TextStyle(fontSize: 16)),
            const Text('⭐ 4.9', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),

            // Functional Icons
            Expanded(
              child: ListView(
                children: [
                  _buildListTile(context, Icons.inbox, 'Inbox', () {
                    // Navigate to Inbox screen
                  }),
                  _buildListTile(context, Icons.shopping_cart, 'Rent Item', () {
                    // Navigate to Rent Item screen
                  }),
                  _buildListTile(context, Icons.swap_horiz, 'Exchange', () {
                    // Navigate to Exchange screen
                  }),
                  _buildListTile(context, Icons.label, 'Sell', () {
                    // Navigate to Sell screen
                  }),
                  _buildListTile(context, Icons.video_library, 'Tutoring Video', () {
                    // Navigate to Tutoring Video screen
                  }),
                  _buildListTile(context, Icons.help, 'Help and Support', () {
                    // Navigate to Help and Support screen
                  }),
                  _buildListTile(context, Icons.settings, 'Setting', () {
                    // Navigate to Settings screen
                  }),
                  _buildListTile(context, Icons.logout, 'Log Out', () {
                    _logout(context); // Call the logout function
                  }),
                ],
              ),
            ),
          ],
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
        currentIndex: 4, // Set the index for the Profile screen
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          // Handle navigation based on the selected index
          if (index != 4) {
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
                  case 3:
                    return const CartScreen(); // Cart
                  default:
                    return const ProfileScreen(); // Stay on Profile
                }
              }),
            );
          }
        },
      ),
    );
  }

  void _logout(BuildContext context) {
    // Clear user session (e.g., remove token, clear preferences)
    // Example: await SharedPreferences.getInstance().then((prefs) => prefs.clear());

    // Navigate to the login screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()), // Adjust to your actual login screen
    );
  }

  Widget _buildListTile(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
