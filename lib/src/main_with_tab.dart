import 'package:flutter/material.dart';
import 'package:stroll_task_1/src/stroll_bonfire_screen.dart';

class MainHomeTab extends StatefulWidget {
  const MainHomeTab({super.key});

  @override
  State<MainHomeTab> createState() => _MainHomeTabState();
}

class _MainHomeTabState extends State<MainHomeTab> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    StrollBonfirePage(),
    Center(
      child: Text(
        "Home",
        style: TextStyle(fontSize: 24),
      ),
    ),
    Center(
      child: Text(
        "Chat",
        style: TextStyle(fontSize: 24),
      ),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      String iconImg, String label, int index) {
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
        backgroundColor: Colors.black,
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff0F1115),
          items: [
            _buildBottomNavigationBarItem("assets/icons/Card.png", 'Assets', 0),
            _buildBottomNavigationBarItem("assets/icons/bonfire.png", 's', 1),
            _buildBottomNavigationBarItem("assets/icons/chat.png", 's', 1),
            _buildBottomNavigationBarItem("assets/icons/user.png", 's', 1),
          ],
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ));
  }
}
