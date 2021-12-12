import 'package:flutter/material.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';
import 'package:nardilibraryapp/ui/views/add_resource.dart';
import 'package:nardilibraryapp/ui/views/admin_functions.dart';
import 'package:nardilibraryapp/ui/views/book_shelf_screen.dart';
import 'package:nardilibraryapp/ui/views/home_page.dart';
import 'package:nardilibraryapp/ui/views/profile_screen.dart';

class AdminDashboard extends StatefulWidget {
  AdminDashboard({Key? key}) : super(key: key);
  static const routeName = "/adminDashboard";
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<AdminDashboard> {
  var navBarLocations = [HomePage(), BookShelf(),AdminFunction(), Profile()];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navBarLocations[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          unselectedItemColor: AppColors.unselectedColor,
          selectedItemColor: AppColors.backgroundColor,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: 'Library',
              icon: Icon(Icons.library_books),
            ),
            BottomNavigationBarItem(
              label: 'Bookshelf',
              icon: Icon(Icons.book),
            ),
             BottomNavigationBarItem(
              label: 'Admin',
              icon: Icon(Icons.admin_panel_settings),
            ),
            BottomNavigationBarItem(
              label: 'Me',
              icon: Icon(Icons.person),
            ),
          ]),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
