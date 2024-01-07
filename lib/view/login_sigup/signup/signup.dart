import 'package:fleact_tech/res/colors/app_colors.dart';
import 'package:fleact_tech/res/common_widgets/button_widget.dart';
import 'package:fleact_tech/res/common_widgets/text_data.dart';
import 'package:fleact_tech/res/common_widgets/text_field_widget.dart';
import 'package:fleact_tech/view/login_sigup/signup/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

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
                    'Register an account',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.black),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                TextData(text: 'First Name'),
                Consumer<SignupProvider>(
                  builder: (context, value, child) => TextFieldWidget(
                    controller: value.firstNameController,
                    hintText: 'Usama',
                    onTap: () {},
                    onChanged: (value) {
                      return null;
                    },
                    onValidate: (value) {
                      if (value.isEmpty) {
                        return "first name field can't empty";
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
                TextData(text: 'Last Name'),
                Consumer<SignupProvider>(
                  builder: (context, value, child) => TextFieldWidget(
                    controller: value.lastNameController,
                    hintText: 'ahmad',
                    onTap: () {},
                    onChanged: (value) {
                      return null;
                    },
                    onValidate: (value) {
                      if (value.isEmpty) {
                        return "last name field can't empty";
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
                TextData(text: 'Email'),
                Consumer<SignupProvider>(
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
                TextData(text: 'Phone Number'),
                Consumer<SignupProvider>(
                  builder: (context, value, child) => TextFieldWidget(
                    controller: value.phoneController,
                    hintText: '0123456789',
                    onTap: () {},
                    onChanged: (value) {
                      return null;
                    },
                    onValidate: (value) {
                      if (value.isEmpty) {
                        return "phone field can't empty";
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
                Consumer<SignupProvider>(
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
                TextData(text: 'Confirm Password'),
                Consumer<SignupProvider>(
                  builder: (context, value, child) => TextFieldWidget(
                    controller: value.confirmController,
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
                        return "confirm password field can't empty";
                      }
                      return null;
                    },
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(height * 0.01),
                        borderSide: BorderSide(color: AppColors.grey)),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Consumer<SignupProvider>(
                    builder: (context, value, child) => Center(
                          child: ButtonWidget(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                print('Go To Home Screen');
                                value.signup(context);
                              }
                            },
                            text: 'Create Account',
                            loading: value.loading,
                          ),
                        )),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: AppColors.grey),
                    ),
                    Consumer<SignupProvider>(
                      builder: (context, value, child) => InkWell(
                        onTap: () {
                          print('Go to Signin Screen');
                          value.navigateTologin(context);
                        },
                        child: Text(
                          "Login",
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
