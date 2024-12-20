import 'package:flutter/material.dart';
import 'main_navigation.dart';
import 'user_dashboard.dart';
import 'store_screen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';

class AddItemScreen extends StatelessWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
        backgroundColor: const Color(0xFF4DE165),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(height: 16),

              // Add Photo Button
              ElevatedButton(
                onPressed: () {
                  // Handle photo upload
                },
                child: const Text('+ Add Photo'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Product Name Field
              _buildTextField('Product Name *', 'Enter Product Name', 1000),
              const SizedBox(height: 16),

              // Product Description Field
              _buildTextField('Product Description *', 'Enter Product Description', 3000),
              const SizedBox(height: 16),

              // Category Dropdown
              _buildDropdown('Category *', ['Books', 'Electronics', 'Clothing']),
              const SizedBox(height: 16),

              // Condition Dropdown
              _buildDropdown('Condition *', ['New', 'Used']),
              const SizedBox(height: 16),

              // Price Field
              _buildTextField('Price *', 'Enter Price', 100),
              const SizedBox(height: 16),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  // Handle item submission
                },
                child: const Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
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
        currentIndex: 2, // Set the index for the Add Item screen
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          // Handle navigation based on the selected index
          if (index != 2) {
            // Navigate to the selected screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                switch (index) {
                  case 0:
                    return const UserDashboard(); // Home
                  case 1:
                    return const StoreScreen(); // Store
                  case 3:
                    return const CartScreen(); // Cart
                  case 4:
                    return const ProfileScreen(); // Profile
                  default:
                    return const AddItemScreen(); // Stay on Add Item
                }
              }),
            );
          }
        },
      ),
    );
  }

  Widget _buildTextField(String label, String hint, int maxLength) {
    return TextField(
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items) {
    String? selectedValue;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        DropdownButtonFormField<String>(
          value: selectedValue,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            selectedValue = newValue;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
