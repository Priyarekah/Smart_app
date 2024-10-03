import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'landing_page.dart';
import 'search_page.dart';

void main() {
  runApp(const MyApp());
}

// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Use ChangeNotifierProvider to allow state management
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Smart_Commute App', // App title
        theme: ThemeData(
          useMaterial3: true, // Use Material 3 design
          colorScheme:
              ColorScheme.fromSeed(seedColor: Colors.blue), // Theme color
        ),
        home: const MainPage(), // Main page is displayed on app launch
      ),
    );
  }
}

// App state using ChangeNotifier for state management
class MyAppState extends ChangeNotifier {
  // Add state variables and logic here if needed for future development
}

// MainPage widget that holds the BottomNavigationBar and page navigation
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

// MainPage state class that controls page switching
class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0; // Current selected tab index

  // List of pages corresponding to the BottomNavigationBar
  final List<Widget> _pages = [
    MyHomePage(), // Home page
    SearchPage(), // Link to SearchPage
    FavouritesPage(), // Favourites page placeholder
    SettingsPage(), // Settings page placeholder
  ];

  // Handle tap on navigation items
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle()), // Set dynamic title based on selected page
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        // Define BottomNavigationBar items
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Icon for Home tab
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search), // Icon for Search tab
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite), // Icon for Favourites tab
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings), // Icon for Settings tab
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex, // Current tab index
        onTap: _onItemTapped, // Handle tab change
        selectedItemColor: Colors.blue, // Color for selected tab
        unselectedItemColor: Colors.grey, // Color for unselected tabs
        backgroundColor: Colors.grey[300], // Background color of navigation bar
      ),
    );
  }

  // Helper function to get dynamic title based on the selected tab
  String _getTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'Home';
      case 1:
        return 'Search';
      case 2:
        return 'Favourites';
      case 3:
        return 'Settings';
      default:
        return 'App';
    }
  }
}

// MyHomePage widget for the Home tab
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Full-screen layout with images at the top, center, and bottom
    return Scaffold(
      body: Stack(
        children: [
          // Use a Column to arrange the top, center, and bottom images
          Column(
            children: [
              // Top image
              Expanded(
                flex: 1,
                child: Image.asset(
                  'assets/images/top.png', // Top image
                  height: 500,
                  width: 400, // Fixed size for the top image
                ),
              ),
              // Center image
              Expanded(
                flex: 1,
                child: Image.asset(
                  'assets/images/center.png', // Center image
                  height: 700,
                  width: 900, // Fixed size for the center image
                ),
              ),
              // Bottom image
              Expanded(
                flex: 1,
                child: Image.asset(
                  'assets/images/bottom.png', // Bottom image
                  height: 1000,
                  width: 900, // Fixed size for the bottom image
                ),
              ),
              // Button placed at the bottom-right corner
              Positioned(
                bottom: 10,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the login page when button is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LandingPage()),
                    );
                  },
                  child: const Text('Get Started'), // Button label
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Placeholder for a card component (not currently used)
class BigCard extends StatelessWidget {
  const BigCard({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary, // Text color
    );
    return Card(
      color: theme.colorScheme.primary, // Card background color
      // The card could display more content here, but it's currently empty
    );
  }
}

// Search page
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Full-screen layout with images at the top, center, and bottom
    return Scaffold(
      body: Stack(
        children: [
          // Use a Column to arrange the top, center, and bottom images
          Column(
            children: [
              // Top image
              Expanded(
                flex: 1,
                child: Image.asset(
                  'assets/images/top.png', // Top image
                  height: 500,
                  width: 400, // Fixed size for the top image
                ),
              ),

              // Button placed at the bottom-right corner
              Positioned(
                bottom: 10,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the login page when button is clicked
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchPage()));
                  },
                  child: const Text('Get Started'), // Button label
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Placeholder for Favourites page
class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('Favourites Page Placeholder')); // Placeholder text
  }
}

// Placeholder for Settings page
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('Settings Page Placeholder')); // Placeholder text
  }
}
