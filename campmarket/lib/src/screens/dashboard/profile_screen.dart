import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'user_dashboard.dart'; // Import the UserDashboard
import 'store_screen.dart'; // Import the StoreScreen
import 'add_item_screen.dart'; // Import the AddItemScreen
import 'cart_screen.dart'; // Import the CartScreen

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 4; // Assuming profile is the 5th item

  // List of screens to navigate to
  final List<Widget> _screens = [
    UserDashboard(), // Home
    StoreScreen(),   // Store
    AddItemScreen(), // Add Item
    CartScreen(),    // Cart
    ProfileScreen(), // Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigate to the selected screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => _screens[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/campus_background.jpg', // Replace with your background image path
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Campus Marketing',
                      style: GoogleFonts.irishGrover(
                        fontSize: 24,
                        color: Colors.green,
                      ),
                    ),
                    Icon(Icons.notifications, color: Colors.black),
                  ],
                ),
                const SizedBox(height: 20),

                // User Info Box
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/images/profile.jpg'), // Replace with user image
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sudai Alhad',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'sudai.alhad@one.uz.edu.ph',
                                style: TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '⭐ 4.9',
                                style: TextStyle(color: Colors.yellow),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to dashboard
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        ),
                        child: const Text('Dashboard', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Menu Items
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                    ),
                    child: ListView(
                      children: [
                        _buildMenuItem(Icons.inbox, 'Inbox'),
                        _buildMenuItem(Icons.business_center, 'Rent Item'),
                        _buildMenuItem(Icons.swap_horiz, 'Exchange'),
                        _buildMenuItem(Icons.sell, 'Sell'),
                        _buildMenuItem(Icons.video_library, 'Tutoring Video'),
                        _buildMenuItem(Icons.help, 'Help and Support'),
                        _buildMenuItem(Icons.settings, 'Setting'),
                        _buildMenuItem(Icons.logout, 'Log Out', isExit: true), // Exit button
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
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
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {bool isExit = false}) {
    return ListTile(
      leading: Icon(icon, color: isExit ? Colors.red : Colors.black),
      title: Text(title),
      onTap: () {
        if (isExit) {
          // Handle exit action
          // For example, show a confirmation dialog or navigate to the login screen
        } else {
          // Handle other menu item taps
        }
      },
    );
  }
}
