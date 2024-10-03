import 'package:flutter/material.dart';
import 'register_page.dart';
import 'login_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center everything vertically
        children: [
          // Top image
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/images/top.png', // Top image
              height: 500,
              width: 400, // Cover the available space
            ),
          ),
          // Center image
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/images/center.png', // Center image
              height: 800,
              width: 900, // Cover the available space
            ),
          ),
          // Buttons at the bottom
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 0.0), // Adds space between image and buttons
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the registration page when button is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50), // Set button size
                  ),
                  child: const Text('Register', style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(height: 20), // Space between buttons
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the login page when button is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50), // Set button size
                  ),
                  child: const Text('Login', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
