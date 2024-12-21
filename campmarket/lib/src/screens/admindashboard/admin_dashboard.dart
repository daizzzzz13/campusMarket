import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            const SizedBox(height: 16),
            _buildPostStats(),
            const SizedBox(height: 16),
            _buildPopularItems(),
            const SizedBox(height: 16),
            _buildTopRatedUsers(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Campus Marketing'),
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

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'search',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildPostStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatCard('Rent Posts', '2 posts'),
        _buildStatCard('Sell Posts', '5 posts'),
        _buildStatCard('Exchange Posts', '1 post'),
        _buildStatCard('Tutorials', '10 posts'),
      ],
    );
  }

  Widget _buildStatCard(String title, String count) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(count),
      ],
    );
  }

  Widget _buildPopularItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Popular', style: TextStyle(fontWeight: FontWeight.bold)),
        // Add your popular items here
        // Example item
        Row(
          children: [
            Image.network('https://example.com/item1.jpg', width: 50, height: 50),
            const Text('Item for Rent: Scientific Calculator'),
            const Text('₱10 per Hour'),
          ],
        ),
        // Add more items as needed
      ],
    );
  }

  Widget _buildTopRatedUsers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Top Rated Users', style: TextStyle(fontWeight: FontWeight.bold)),
        // Add your top-rated users here
        // Example user
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://example.com/user.jpg'),
            ),
            const SizedBox(width: 8),
            const Text('Sudai Alhad ⭐ 4.9'),
          ],
        ),
        // Add more users as needed
      ],
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
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
        // Add more items as needed
      ],
      currentIndex: 0, // Set the current index as needed
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      onTap: (index) {
        // Handle navigation
      },
    );
  }
}
