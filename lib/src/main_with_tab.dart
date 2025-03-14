import 'package:flutter/material.dart';
import 'package:stroll_task_1/src/stroll_bonfire_screen.dart';

class MainHomeTab extends StatefulWidget {
  const MainHomeTab({super.key});

  @override
  State<MainHomeTab> createState() => _MainHomeTabState();
}

class _MainHomeTabState extends State<MainHomeTab> {
  int _currentIndex = 1;

  final List<Widget> _pages = [
    Center(
      child: Text(
        "Home",
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    ),
    StrollBonfirePage(),
    Center(
      child: Text(
        "Chat",
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    ),
    Center(
      child: Text(
        "User",
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      String iconImg, int index) {
    // final isSelected = _currentIndex == index;
    return BottomNavigationBarItem(
        backgroundColor: Colors.black,
        icon: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              Image.asset(
                iconImg,
              ),
            ],
          ),
        ),
        label: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff0F1115),
          items: [
            _buildBottomNavigationBarItem("assets/icons/Card.png", 0),
            _buildBottomNavigationBarItem("assets/icons/bonfire.png", 1),
            _buildBottomNavigationBarItem("assets/icons/chat.png", 1),
            _buildBottomNavigationBarItem("assets/icons/user.png", 1),
          ],
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ));
  }
}
