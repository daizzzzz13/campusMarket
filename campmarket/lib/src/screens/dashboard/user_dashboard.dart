import 'package:flutter/material.dart';
import 'rent_screen.dart'; // Import the RentScreen
import 'profile_screen.dart'; // Import the ProfileScreen
import 'store_screen.dart'; // Import the StoreScreen
import 'add_item_screen.dart'; // Import the AddItemScreen
import 'cart_screen.dart'; // Import the CartScreen

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _selectedIndex = 0; // Track the selected index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the corresponding screen based on the selected index
    switch (index) {
      case 0:
        // Home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const UserDashboard()),
        );
        break;
      case 1:
        // Store
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StoreScreen()),
        );
        break;
      case 2:
        // Add Item
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddItemScreen()),
        );
        break;
      case 3:
        // Cart
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CartScreen()),
        );
        break;
      case 4:
        // Profile
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top App Bar with Logo and Title
          _buildAppBar(),

          // Category Buttons
          _buildCategorySection(context),

          // Search Bar
          _buildSearchBar(),

          // Popular Section
          _buildPopularSection(),

          // Top Rated Users Section
          _buildTopRatedUsersSection(),

          const Spacer(),

          // Bottom Navigation Bar
          _buildBottomNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 10),
      color: const Color(0xFF4DE165),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo.png'),
            radius: 20,
          ),
          const SizedBox(width: 8),
          const Text(
            'Campus Marketing',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue.shade200,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text(
              'Pro',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.notifications, color: Colors.white),
        ],
      ),
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
        if (text == 'Rent') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RentScreen()),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(text),
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

  Widget _buildPopularSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popular',
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPopularItem('Scientific Calculator', 'P50 per Day', 'assets/images/calculator.jpg'),
              _buildPopularItem('Lab Gown', 'P30 per Day', 'assets/images/lab_gown.jpg'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPopularItem(String title, String price, String imagePath) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Image.asset(imagePath, height: 100, width: 100, fit: BoxFit.cover),
          Text('Item for Rent: $title'),
          Text(price, style: const TextStyle(color: Colors.red)),
        ],
      ),
    );
  }

  Widget _buildTopRatedUsersSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Rated Users',
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          _buildTopRatedUser('Sudaiz Alhad', 4.9, 'assets/images/profile.jpg'),
        ],
      ),
    );
  }

  Widget _buildTopRatedUser(String name, double rating, String imagePath) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star, color: Colors.yellow),
          Text('$rating'),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
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
          icon: Icon(Icons.add_circle_outline),
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
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      onTap: _onItemTapped,
    );
  }
}
