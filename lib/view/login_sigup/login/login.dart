import 'package:fleact_tech/res/colors/app_colors.dart';
import 'package:fleact_tech/res/common_widgets/button_widget.dart';
import 'package:fleact_tech/res/common_widgets/cashed_image.dart';
import 'package:fleact_tech/res/common_widgets/text_data.dart';
import 'package:fleact_tech/res/common_widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_provider.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, height * 0.1),
        child: Image.asset('assets/images/img_1.png'),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: width * 0.37,
                      height: height * 0.1,
                      child: Image.asset('assets/images/img.png')),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Text(
                    'Login to your account',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.black),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                TextData(text: 'Email'),
                Consumer<LoginProvider>(
                  builder: (context, value, child) => TextFieldWidget(
                    controller: value.emailController,
                    hintText: 'admin@gmail.com',
                    onTap: () {},
                    onChanged: (value) {
                      return null;
                    },
                    onValidate: (value) {
                      if (value.isEmpty) {
                        return "email field can't empty";
                      }
                      return null;
                    },
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(height * 0.01),
                        borderSide: BorderSide(color: AppColors.grey)),
                  ),
                ),
                SizedBox(
                  height: height * 0.012,
                ),
                TextData(text: 'Password'),
                Consumer<LoginProvider>(
                  builder: (context, value, child) => TextFieldWidget(
                    controller: value.passwordController,
                    hintText: 'Password',
                    suffixIcon: Icons.visibility,
                    hideIcon: Icons.visibility_off,
                    obscure: value.obscure,
                    onTap: () {},
                    passTap: () {
                      value.passHide();
                    },
                    onChanged: (value) {
                      return null;
                    },
                    onValidate: (value) {
                      if (value.isEmpty) {
                        return "password field can't empty";
                      }
                      return null;
                    },
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(height * 0.01),
                        borderSide: BorderSide(color: AppColors.grey)),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Consumer<LoginProvider>(
                            builder: (context, value, child) => InkWell(
                              onTap: () {
                                value.checkChange();
                              },
                              child: value.isChecked
                                  ? SizedBox(
                                      height: height * 0.026,
                                      width: width * 0.06,
                                      child: Image.asset(
                                          'assets/images/img_2.png'),
                                    )
                                  : Container(
                                      height: height * 0.018,
                                      width: width * 0.038,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.black,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              height * 0.004)),
                                    ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text(
                            'Remember me',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: AppColors.grey),
                          )
                        ],
                      ),
                      Consumer<LoginProvider>(
                        builder: (context, value, child) => InkWell(
                          onTap: () {
                            value.navigateToForgetPassword(context);
                          },
                          child: Text(
                            'Forget password',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: AppColors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                Consumer<LoginProvider>(
                    builder: (context, value, child) => Center(
                          child: ButtonWidget(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                print('Go To Home Screen');
                                value.login(context);
                              }
                            },
                            text: 'Log in',
                            loading: value.loading,
                          ),
                        )),
                SizedBox(
                  height: height * 0.25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have account? ",
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: AppColors.grey),
                    ),
                    Consumer<LoginProvider>(
                      builder: (context, value, child) => InkWell(
                        onTap: () {
                          print('Go to SignUp Screen');
                          value.navigateToSignup(context);
                        },
                        child: Text(
                          "Register",
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: AppColors.themeColor),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
