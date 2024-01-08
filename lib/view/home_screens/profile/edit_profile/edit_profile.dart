import 'dart:io';

import 'package:fleact_tech/res/colors/app_colors.dart';
import 'package:fleact_tech/res/common_widgets/button_widget.dart';
import 'package:fleact_tech/res/common_widgets/text_data.dart';
import 'package:fleact_tech/res/common_widgets/text_field_widget.dart';
import 'package:fleact_tech/view/home_screens/profile/edit_profile/edit_profile_provider.dart';
import 'package:fleact_tech/view/home_screens/profile/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Consumer<EditProfileProvider>(
                builder: (context, value, child) => ImageWidget(
                    containerColor: AppColors.black,
                    icon: Icons.camera_alt_outlined,
                    image: value.image,
                    onTap: () {
                      value.imagePicker(context: context, provider: value);
                    }),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextData(text: 'Full Name'),
              Consumer<EditProfileProvider>(
                builder: (context, value, child) => TextFieldWidget(
                  controller: value.fullNameController,
                  hintText: 'Usama Ahmad',
                  onTap: () {},
                  onChanged: (value) {
                    return null;
                  },
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return "name field can't empty";
                    }
                    return null;
                  },
                  focusBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.01),
                      borderSide: BorderSide(color: AppColors.grey, width: 2)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.01),
                      borderSide: BorderSide(color: AppColors.grey)),
                ),
              ),
              SizedBox(
                height: height * 0.012,
              ),
              TextData(text: 'Email'),
              Consumer<EditProfileProvider>(
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
                  focusBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.01),
                      borderSide: BorderSide(color: AppColors.grey, width: 2)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.01),
                      borderSide: BorderSide(color: AppColors.grey)),
                ),
              ),
              SizedBox(
                height: height * 0.012,
              ),
              TextData(text: 'Phone Number'),
              Consumer<EditProfileProvider>(
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
                  focusBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.01),
                      borderSide: BorderSide(color: AppColors.grey, width: 2)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.01),
                      borderSide: BorderSide(color: AppColors.grey)),
                ),
              ),
              SizedBox(
                height: height * 0.012,
              ),
              TextData(text: 'Date of Birth'),
              Consumer<EditProfileProvider>(
                builder: (context, value, child) => InkWell(
                  onTap: () async {
                    final date = await value.slecteDtateTime(context);
                    if (date != null) {
                      value.dobController.text =
                          value.formatter.format(date).toString();
                    }
                  },
                  child: TextFieldWidget(
                    controller: value.dobController,
                    hintText: '31-01-2024',
                    enable: false,
                    onTap: () {},
                    onChanged: (value) {
                      return null;
                    },
                    onValidate: (value) {
                      if (value.isEmpty) {
                        return "Date of Birth field can't empty";
                      }
                      return null;
                    },
                    focusBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(height * 0.01),
                        borderSide:
                            BorderSide(color: AppColors.grey, width: 2)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(height * 0.01),
                        borderSide: BorderSide(color: AppColors.grey)),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.012,
              ),
              TextData(text: 'Birth Gender'),
              Consumer<EditProfileProvider>(
                builder: (context, value, child) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            value: 1,
                            activeColor: AppColors.themeColor,
                            groupValue: value.selectedRadio,
                            onChanged: (val) {
                              value.setSelectedRadio(val!);
                            },
                          ),
                          Text(
                            'Male',
                            style: TextStyle(
                                color: value.selectedRadio == 1
                                    ? AppColors.themeColor
                                    : AppColors.black),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            value: 2,
                            activeColor: AppColors.themeColor,
                            groupValue: value.selectedRadio,
                            onChanged: (val) {
                              value.setSelectedRadio(val!);
                            },
                          ),
                          Text(
                            'Female',
                            style: TextStyle(
                                color: value.selectedRadio == 2
                                    ? AppColors.themeColor
                                    : AppColors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Align(
                  alignment: Alignment.center,
                  child: ButtonWidget(
                      text: 'Update',
                      onTap: () {
                        Navigator.pop(context);
                      })),
              SizedBox(
                height: height * 0.02,
              )
            ],
          ),
        ),
      ),
    );
  }
}
