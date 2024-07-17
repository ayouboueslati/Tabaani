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
    Icons.favorite_outline,
    Icons.chat_bubble_outline,
    Icons.account_circle_outlined
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
        child: Icon(Icons.favorite_outline, size: 64.0, color: Colors.white),
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
        backgroundColor: Colors.white,
        child: Image.asset('assets/tabaani.jpg', width: 24.0, height: 24.0),
        onPressed: () {
          _onItemTapped(2); // Select the middle item when the button is pressed
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.amber : Colors.grey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconList[index], size: 24, color: color),
              const SizedBox(height: 4),
              Text(
                index == 0
                    ? 'Explore'
                    : index == 1
                        ? 'Saved'
                        : index == 2
                            ? 'Inbox'
                            : index == 3
                                ? 'Profile'
                                : 'Profile',
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          );
        },
        backgroundColor: Colors.white,
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
