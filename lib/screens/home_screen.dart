import 'package:flutter/material.dart';
import 'package:flutter_neon_template/screens/feed_screen.dart';
import 'package:flutter_neon_template/screens/profile_screen.dart';
import 'package:flutter_neon_template/screens/settings_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index); // Navigate to the selected page
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                PhosphorIcons.list(),
                size: 23.0,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/drawer_bg.jpg'), // Replace with your background image path
                  fit: BoxFit.cover,
                ),
                color:
                    Colors.transparent, // Optional: adjust based on your design
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                        'assets/images/avatar_img.jpg'), // Replace with your avatar image path
                  ),
                  SizedBox(height: 1),
                  Text(
                    'Your Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Your Title',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Handle item 1 tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Handle item 2 tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 3'),
              onTap: () {
                // Handle item 3 tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 4'),
              onTap: () {
                // Handle item 4 tap
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const <Widget>[
          FeedScreen(),
          Profilescreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              PhosphorIcons.house(),
              size: 23.0,
              color: theme.primary,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              PhosphorIcons.user(),
              size: 23.0,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              PhosphorIcons.gear(),
              size: 23.0,
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
