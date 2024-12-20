import 'package:flutter/material.dart';
import 'rent_items_screen.dart'; // Ensure this is imported

class RentScreen extends StatefulWidget {
  const RentScreen({super.key});

  @override
  State<RentScreen> createState() => _RentScreenState();
}

class _RentScreenState extends State<RentScreen> {
  String activeCategory = 'Rent'; // Default to Rent

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Opacity
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.1),
              colorBlendMode: BlendMode.darken,
            ),
          ),

          Column(
            children: [
              // Top App Bar
              Container(
                padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 10),
                color: Colors.green,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: const AssetImage('assets/images/logo.png'),
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
                    const Icon(Icons.notifications, color: Colors.white),
                  ],
                ),
              ),

              // Category Buttons
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCategoryButton('Rent'),
                    _buildCategoryButton('Exchange'),
                    _buildCategoryButton('Sell'),
                    _buildCategoryButton('Tutoring'),
                  ],
                ),
              ),

              // Search Bar
              Padding(
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
              ),

              // Rent Items Section
              if (activeCategory == 'Rent') _buildRentSection(),

              const Spacer(),

              // Bottom Navigation Bar
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: const Color(0xFF4DE165),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavItem(Icons.home, activeCategory == 'Rent'),
                    _buildNavItem(Icons.store, false),
                    _buildNavItem(Icons.add_circle_outline, false),
                    _buildNavItem(Icons.shopping_cart, false),
                    _buildNavItem(Icons.person, false),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String text) {
    final bool isSelected = activeCategory == text;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          activeCategory = text;
          print('Active category changed to $activeCategory');
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.green : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: isSelected ? 5 : 0,
      ).copyWith(
        side: MaterialStateProperty.all(
          BorderSide(color: isSelected ? Colors.green : Colors.grey),
        ),
      ),
      child: Text(text),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected) {
    return Icon(
      icon,
      color: isSelected ? Colors.white : Colors.white.withOpacity(0.7),
      size: 30,
    );
  }
} 