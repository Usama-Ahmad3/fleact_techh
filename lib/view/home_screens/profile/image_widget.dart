import 'dart:io';

import 'package:fleact_tech/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageWidget extends StatelessWidget {
  File? image;
  VoidCallback onTap;
  Color? containerColor;
  IconData? icon;
  ImageWidget(
      {super.key,
      this.image,
      required this.onTap,
      this.containerColor,
      this.icon});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Center(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Stack(
            children: [
              Container(
                  height: height * 0.15,
                  width: width * 0.5,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.shadowColor.withOpacity(0.2),
                          offset: const Offset(1, 1),
                          blurStyle: BlurStyle.normal,
                          blurRadius: 12,
                          spreadRadius: 3)
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: image != null
                      ? CircleAvatar(
                          backgroundImage: FileImage(image!.absolute),
                        )
                      : const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://tse1.mm.bing.net/th?id=OIP.mEma0ZcipymPAHIYoIuFiAHaJa&pid=Api&P=0&h=220'),
                        )),
              Positioned(
                  bottom: 0,
                  right: width * 0.1,
                  child: InkWell(
                    onTap: onTap,
                    child: Container(
                      width: width * 0.1,
                      height: height * 0.04,
                      decoration: BoxDecoration(
                          color: containerColor ?? AppColors.themeColor,
                          shape: BoxShape.circle),
                      child: Icon(
                        icon ?? Icons.edit,
                        color: AppColors.white,
                      ),
                    ),
                  ))
            ],
          )),
    );
  }
}
