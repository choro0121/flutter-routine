import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:routine/views/screens/top_screen.dart';
import 'package:routine/views/screens/list_screen.dart';
import 'package:routine/views/screens/setting_screen.dart';

class NavigationItem {
  Icon icon;
  String text;
  Widget page;
  NavigationItem({this.icon, this.text, this.page});
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;

  int _navIndex = 0;
  final _navItems = [
    NavigationItem(
      icon: Icon(Icons.query_builder),
      page: TopScreen(),
    ),
    NavigationItem(
      icon: Icon(Icons.date_range),
      page: ListScreen(),
    ),
    NavigationItem(
      icon: Icon(Icons.settings),
      page: SettingScreen(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _navIndex,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: _navIndex,
        height: 50.0,
        color: Colors.black,
        backgroundColor: Colors.grey[850],
        buttonBackgroundColor: Colors.blue,
        items: List<Widget>.generate(
          _navItems.length,
          (index) => _navItems[index].icon,
        ),
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 600),
            curve: Curves.ease,
          );
        },
      ),
      body: PageView(
        controller: _pageController,
        physics: new NeverScrollableScrollPhysics(),
        children: List<Widget>.generate(
          _navItems.length,
          (index) => _navItems[index].page,
        ),
      ),
    );
  }
}
