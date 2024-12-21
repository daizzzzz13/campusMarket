import 'package:flutter/material.dart';
import 'main_navigation.dart'; // Ensure this import is present
import 'user_dashboard.dart'; // Import UserDashboard
import 'cart_screen.dart';    // Import CartScreen
import 'store_screen.dart';   // Import StoreScreen
import 'add_item_screen.dart'; // Import AddItemScreen
import '../auth/login_screen.dart'; // Import your LoginScreen
import 'exchange_screen.dart'; // Import the ExchangeScreen
import 'sell_screen.dart'; // Import the SellScreen
import 'tutoring_screen.dart';
import 'rent_screen.dart'; // Import the TutoringScreen

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildCategorySection(context),
          _buildSearchBar(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://example.com/profile.jpg'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Sudai Alhad', style: TextStyle(fontSize: 24)),
                    Text('sudai.alhad@one.uz.edu.ph', style: TextStyle(fontSize: 16)),
                    Text('⭐ 4.9', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildListTile(context, Icons.inbox, 'Inbox', () {}),
                _buildListTile(context, Icons.shopping_cart, 'Rent Item', () {}),
                _buildListTile(context, Icons.swap_horiz, 'Exchange', () {}),
                _buildListTile(context, Icons.label, 'Sell', () {}),
                _buildListTile(context, Icons.video_library, 'Tutoring Video', () {}),
                _buildListTile(context, Icons.help, 'Help and Support', () {}),
                _buildListTile(context, Icons.settings, 'Setting', () {}),
                _buildListTile(context, Icons.logout, 'Log Out', () {
                  _logout(context);
                }),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Profile'),
      backgroundColor: const Color(0xFF4DE165),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            // Handle notification action
          },
        ),
      ],
    );
  }

  Widget _buildCategorySection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCategoryButton(context, 'Rent'),
          _buildCategoryButton(context, 'Exchange'),
          _buildCategoryButton(context, 'Sell'),
          _buildCategoryButton(context, 'Tutoring'),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, String text) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to the corresponding screen using pushReplacement
        switch (text) {
          case 'Rent':
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const RentScreen()),
            );
            break;
          case 'Exchange':
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ExchangeScreen()),
            );
            break;
          case 'Sell':
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SellScreen()),
            );
            break;
          case 'Tutoring':
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const TutoringScreen()),
            );
            break;
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          suffixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
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
