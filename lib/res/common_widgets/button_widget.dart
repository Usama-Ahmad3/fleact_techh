import 'package:fleact_tech/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  VoidCallback onTap;
  String text;
  bool loading;
  ButtonWidget(
      {super.key,
      required this.text,
      required this.onTap,
      this.loading = false});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: height * 0.065,
        width: width * 0.85,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: AppColors.containerB12.withOpacity(0.2),
                  blurStyle: BlurStyle.normal,
                  offset: const Offset(0.5, 1),
                  blurRadius: 10,
                  spreadRadius: 5)
            ],
            color: AppColors.themeColor,
            borderRadius: BorderRadius.circular(height * 0.015)),
        child: Center(
            child: widget.loading
                ? CircularProgressIndicator(
                    color: AppColors.white,
                  )
                : Text(
                    widget.text,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: AppColors.white),
                  )),
      ),
    );
  }
}
