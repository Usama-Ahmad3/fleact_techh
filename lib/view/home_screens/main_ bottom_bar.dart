import 'package:fleact_tech/res/colors/app_colors.dart';
import 'package:fleact_tech/view/home_screens/calender/calender.dart';
import 'package:fleact_tech/view/home_screens/main_home/home_screen.dart';
import 'package:fleact_tech/view/home_screens/notification/notification.dart';
import 'package:flutter/material.dart';
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
    ProfileScreen(),
  ];
  _onTabSelected(int index) {
    _initialIndex = index;
    widget.index = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        body: Stack(children: [
      IndexedStack(
        index: _initialIndex,
        children: page,
      ),
      Positioned(
        bottom: height * 0.045,
        left: width * 0.1,
        right: width * 0.1,
        child: Container(
          height: height * 0.06,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(height * 0.05),
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor.withOpacity(0.2),
                  offset: const Offset(0.5, 1),
                  blurStyle: BlurStyle.normal,
                  blurRadius: 2,
                  spreadRadius: 1)
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBottomNavigationItem(
                image: 'null',
                icon: Icons.home_outlined,
                isSelected: _initialIndex == 0,
                onTap: () {
                  _onTabSelected(0);
                },
              ),
              CustomBottomNavigationItem(
                image: 'null',
                icon: Icons.calendar_month_rounded,
                isSelected: _initialIndex == 1,
                onTap: () {
                  _onTabSelected(1);
                },
              ),
              CustomBottomNavigationItem(
                image: 'null',
                icon: Icons.notifications_none,
                isSelected: _initialIndex == 2,
                onTap: () {
                  _onTabSelected(2);
                },
              ),
              CustomBottomNavigationItem(
                icon: Icons.person,
                image: null,
                isSelected: _initialIndex == 3,
                onTap: () {
                  _onTabSelected(3);
                },
              ),
            ],
          ),
        ),
      )
    ]));
  }
}

class CustomBottomNavigationItem extends StatelessWidget {
  IconData icon;
  bool isSelected;
  VoidCallback onTap;
  String? image;

  CustomBottomNavigationItem(
      {super.key,
      required this.icon,
      required this.isSelected,
      required this.onTap,
      this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          image != null
              ? Icon(
                  icon,
                  color: isSelected ? AppColors.themeColor : AppColors.grey,
                  size: MediaQuery.sizeOf(context).height * 0.027,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.sizeOf(context).height * 01),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.024,
                    child: Image.network(
                        'https://tse4.mm.bing.net/th?id=OIP.lUrKsOfeK0wvfeb8VbYO0wHaKt&pid=Api&P=0&h=220'),
                  ),
                ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.002),
          isSelected
              ? Container(
                  height: MediaQuery.sizeOf(context).height * 0.003,
                  width: MediaQuery.sizeOf(context).height * 0.02,
                  color: Colors.red,
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
