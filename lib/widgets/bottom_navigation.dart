import 'package:flutter/material.dart';
import 'package:mobile/pages/chabot.dart';
import '../pages/home.dart';
import '../pages/about.dart';
import '../pages/profile.dart';

class BottomNavigation extends StatefulWidget {
  final int selectedIndex;
  final int pageIndex;

  const BottomNavigation({super.key, required this.pageIndex, required this.selectedIndex});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late int _selectedIndex;
  late int _pageIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
    _pageIndex = widget.pageIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index == _selectedIndex && index == _pageIndex) {
        return; // Do nothing if the same button is tapped
      }
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
          break;
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ChatbotPage()),
          );
          break;
        case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: const Color.fromRGBO(174, 255, 251, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItem(const Icon(Icons.home_filled), "Home", 0),
          _buildItem(
              const ImageIcon(
                AssetImage('assets/icons/mage_robot-happy.png'),
                size: 25,
              ),
              "Chatbot",
              1),
          _buildItem(const Icon(Icons.account_circle_outlined), "Profile",
              2), // Use Icon widget here
        ],
      ),
    );
  }

  Widget _buildItem(Widget icon, String label, int index) {
    final bool isSelected = index == _selectedIndex;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon, // Now accepts either Icon or ImageIcon
          SizedBox(height: isSelected ? 3.0 : 0),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
              fontSize: isSelected ? 14.0 : 12.0,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
