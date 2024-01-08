import 'package:fleact_tech/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Calender',
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: Container(
          color: AppColors.themeColor,
          child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.059, vertical: height * 0.02)))),
    );
  }
}
