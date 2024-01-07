import 'package:fleact_tech/res/colors/app_colors.dart';
import 'package:fleact_tech/view/home_screens/calender/calender.dart';
import 'package:fleact_tech/view/home_screens/main_home/home_screen.dart';
import 'package:fleact_tech/view/home_screens/notification/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import 'profile/profile_screen.dart';

class MainBottomBar extends StatefulWidget {
  int index;
  MainBottomBar({super.key, this.index = 0});

  @override
  State<MainBottomBar> createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
  @override
  void initState() {
    _initialIndex = widget.index;
    super.initState();
  }

  int _initialIndex = 0;
  final page = [
    const HomeScreen(),
    const Calender(),
    const NotiFication(),
    const ProfileScreen(),
  ];
  pageChange(int index) {
    _initialIndex = index;
    widget.index = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.indicator,
        elevation: 2,
        backgroundColor: AppColors.grey200,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(height * 0.03)),
            borderSide: BorderSide.none),
        padding: EdgeInsets.only(
            bottom: height * 0.03, left: width * 0.05, right: width * 0.05),
        snakeViewColor: AppColors.themeColor,
        selectedItemColor: AppColors.themeColor,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _initialIndex,
        onTap: (index) => pageChange(index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'calendar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notification_important), label: 'notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
      body: page[_initialIndex],
    );
  }
}
