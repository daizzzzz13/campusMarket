import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'user_dashboard.dart';
import 'cart_screen.dart';
import 'store_screen.dart';
import 'add_item_screen.dart';
import '../auth/login_screen.dart';
import 'exchange_screen.dart';
import 'sell_screen.dart';
import 'tutoring_screen.dart';
import 'rent_screen.dart';
import 'edit_name_screen.dart'; // Import the edit screen

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _firstName;
  String? _lastName;
  String? _email;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserInfo();
  }

  /// Fetch user information from Supabase
  Future<void> _fetchUserInfo() async {
    try {
      final user = Supabase.instance.client.auth.currentUser;

      if (user != null) {
        final response = await Supabase.instance.client
            .from('profiles')
            .select('first_name, last_name, email')
            .eq('id', user.id)
            .single();

        if (response != null) {
          setState(() {
            _firstName = response['first_name'];
            _lastName = response['last_name'];
            _email = response['email'];
            _isLoading = false;
          });
          print('Fetched profile: $_firstName $_lastName');
        } else {
          setState(() {
            _firstName = 'First';
            _lastName = 'Last';
            _email = 'No email available';
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      print('Error fetching user info: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// Refresh profile information after editing
  void _refreshProfile() {
    setState(() {
      _isLoading = true;
    });
    _fetchUserInfo();
  }

  /// Logout logic
  Future<void> _logout() async {
    try {
      await Supabase.instance.client.auth.signOut();
      Navigator.pushReplacementNamed(context, '/login'); // Adjust your login route
    } catch (e) {
      print('Error logging out: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to log out. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFF4DE165),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.purple.shade200,
                        child: const Icon(Icons.person, size: 30, color: Colors.white),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${_firstName ?? ''} ${_lastName ?? ''}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditNameScreen(
                                          firstName: _firstName ?? '',
                                          lastName: _lastName ?? '',
                                          onUpdate: _refreshProfile,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            Text(
                              _email ?? 'No email available',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            const Text(
                              '⭐ 4.9',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildListTile(Icons.inbox, 'Inbox', () => _navigateTo('Inbox')),
                        _buildListTile(Icons.shopping_cart, 'Rent Item', () => _navigateTo('Rent Item')),
                        _buildListTile(Icons.swap_horiz, 'Exchange', () => _navigateTo('Exchange')),
                        _buildListTile(Icons.label, 'Sell', () => _navigateTo('Sell')),
                        _buildListTile(Icons.video_library, 'Tutoring Video', () => _navigateTo('Tutoring Video')),
                        _buildListTile(Icons.help, 'Help and Support', () => _navigateTo('Help and Support')),
                        _buildListTile(Icons.settings, 'Setting', () => _navigateTo('Setting')),
                        _buildListTile(Icons.logout, 'Logout', _logout), // Added logout button
                      ],
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
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
      currentIndex: 4, // Set to Profile tab
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/user_dashboard');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/store');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/add_item');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/cart');
            break;
          case 4:
            // Already on Profile screen, do nothing
            break;
        }
      },
    );
  }

  void _navigateTo(String title) {
    print('Navigating to $title'); // Placeholder for navigation logic
  }
}