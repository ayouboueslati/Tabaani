import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  static const String id = 'bottom_navbar';

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _bottomNavIndex = 0;

  final List<IconData> iconList = [
    Icons.search,
    Icons.favorite,
    Icons.chat_bubble_outline,
    Icons.account_circle_rounded
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  final List<Widget> _widgetOptions = [
    Container(
      color: Colors.blue,
      child: Center(
        child: Icon(Icons.search, size: 64.0, color: Colors.white),
      ),
    ),
    Container(
      color: Colors.red,
      child: Center(
        child: Icon(Icons.favorite, size: 64.0, color: Colors.white),
      ),
    ),
    Container(
      color: Colors.green,
      child: Center(
        child: Icon(Icons.chat_bubble_outline, size: 64.0, color: Colors.white),
      ),
    ),
    Container(
      color: Colors.orange,
      child: Center(
        child:
            Icon(Icons.account_circle_rounded, size: 64.0, color: Colors.white),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: _widgetOptions[_bottomNavIndex],
      ),
      floatingActionButton: FloatingActionButton(
        child: Image.asset('assets/tabaani.jpg', width: 24.0, height: 24.0),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: _onItemTapped,
      ),
    );
  }
}
