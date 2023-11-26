// import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:acne_detection/Views/CategoryScreen.dart';
import 'package:acne_detection/Views/DetectionScreen.dart';
import 'package:acne_detection/Views/HomeScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:acne_detection/Common/style.dart';

class BottomNavigation extends StatefulWidget {
  static const routeName = '/bottom_navigation';

  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List Screens = [
    const DetectionScreen(),
    const HomeScreen(),
    const CategoryScreen(),
  ];
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.primaryColor,
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        index: _selectedIndex,
        backgroundColor: ColorStyles.primaryColor,
        color: ColorStyles.secondaryColor,
        animationDuration: Duration(milliseconds: 300),
        items: const [
          Icon(
            Icons.face,
            color: ColorStyles.textColor,
            size: 25,
          ),
          Icon(
            Icons.home,
            color: ColorStyles.textColor,
            size: 25,
          ),
          Icon(
            Icons.category,
            color: ColorStyles.textColor,
            size: 25,
          ),
        ],
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: Screens[_selectedIndex],
    );
  }
}
