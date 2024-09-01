import 'package:flutter/material.dart';
import 'package:flutter_neon_template/screens/feed_screen.dart';
import 'package:flutter_neon_template/screens/profile_screen.dart';
import 'package:flutter_neon_template/screens/settings_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_neon_template/providers/theme_provider.dart'; // Import your ThemeProvider

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 1;
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
    final themeProvider =
        Provider.of<ThemeProvider>(context); // Access ThemeProvider

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Screen',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: theme.onSurface,
          ),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                PhosphorIcons.list(),
                size: 23.0,
                color: theme.onSurface,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.themeMode == ThemeMode.light
                  ? PhosphorIcons.moon()
                  : PhosphorIcons.sun(),
              color: theme.onSurface,
            ),
            onPressed: () {
              themeProvider.toggleTheme(); // Toggle the theme
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(themeProvider.themeMode == ThemeMode.dark
                      ? 'assets/images/dark_bg.jpg'
                      : 'assets/images/light_bg.png'), // Change image based on theme
                  fit: BoxFit.cover,
                ),
                color: theme.surface, // surface color of the header
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/avatar_img.jpg'),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Your Name',
                    style: TextStyle(
                      color: theme.onSurface,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    'Your Title',
                    style: TextStyle(
                      color: theme.onSurface.withOpacity(0.7),
                      fontSize: 10.0,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Item 1', style: TextStyle(color: theme.onSurface)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2', style: TextStyle(color: theme.onSurface)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 3', style: TextStyle(color: theme.onSurface)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 4', style: TextStyle(color: theme.onSurface)),
              onTap: () {
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
          ProfileScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              PhosphorIcons.house(),
              size: 23.0,
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
