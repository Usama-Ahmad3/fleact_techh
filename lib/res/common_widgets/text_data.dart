import 'package:flutter/material.dart';

class TextData extends StatelessWidget {
  String text;
  TextData({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.06, vertical: height * 0.01),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
