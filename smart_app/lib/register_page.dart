import 'package:flutter/material.dart';
import 'search_page.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder for username input
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Placeholder for email input
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Placeholder for password input
            TextField(
              obscureText: true, // Hide the text for password field
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Placeholder for confirm password input
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Submit button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
                // Add your registration logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Registration Submitted')),
                );
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
