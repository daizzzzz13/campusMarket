import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'src/screens/auth/login_screen.dart';
import 'src/screens/auth/register_screen.dart';
import 'src/screens/dashboard/user_dashboard.dart';

Future<void> main() async {
  // Ensure Flutter widgets are properly initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase with your project details
  await Supabase.initialize(
    url: 'https://ussawyzusbiomweppaix.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVzc2F3eXp1c2Jpb213ZXBwYWl4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ1NDE2MjksImV4cCI6MjA1MDExNzYyOX0.X1PKZNaZm0RQn-gRTGK9JU0Wiws4NXkzwqyq2gTjGqg',
  );

  // Run the Flutter app
  runApp(MyApp());
}

// Main app widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Supabase Auth App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/user_dashboard': (context) => UserDashboard(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}
