import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, height * 0.1),
        child: Image.asset('assets/images/img_1.png'),
      ),
      body: Center(
        child: Text(
          'Forget Password',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
