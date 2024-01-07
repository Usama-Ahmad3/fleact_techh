import 'package:fleact_tech/main.dart';
import 'package:fleact_tech/res/colors/app_colors.dart';
import 'package:fleact_tech/res/common_widgets/cashed_image.dart';
import 'package:fleact_tech/view/home_screens/profile/image_widget.dart';
import 'package:fleact_tech/view/home_screens/profile/profile_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    var provider = Provider.of<ProfileScreenProvider>(context, listen: false);
    provider.getFamily();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title: Text(
          'My Profile',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColors.white),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.notes,
          color: AppColors.white,
        ),
        actions: [
          Icon(
            Icons.settings,
            color: AppColors.white,
          ),
          SizedBox(
            width: width * 0.03,
          )
        ],
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
                    horizontal: width * 0.059, vertical: height * 0.02),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<ProfileScreenProvider>(
                        builder: (context, value, child) =>
                            ImageWidget(onTap: () {
                          value.navigateToEditProfile(
                            context: context,
                          );
                        }),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      const Align(
                          alignment: Alignment.center,
                          child: Text('Mathew Adam')),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'mathew@email.com',
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: AppColors.grey),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                              2,
                              (index) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.02),
                                    child: container(
                                        height: height,
                                        width: width,
                                        context: context,
                                        text1: '23y 4m',
                                        text2: 'age'),
                                  ))
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(
                        'Family Members',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Consumer<ProfileScreenProvider>(
                          builder: (context, value, child) {
                        return value.family.isEmpty
                            ? const CircularProgressIndicator()
                            : SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    ...List.generate(value.family.length + 1,
                                        (index) {
                                      int len = value.family.length;
                                      return index < len
                                          ? Column(
                                              children: [
                                                Container(
                                                    height: height * 0.05,
                                                    width: width * 0.2,
                                                    decoration: BoxDecoration(
                                                      color: AppColors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: AppColors
                                                                .shadowColor
                                                                .withOpacity(
                                                                    0.2),
                                                            offset:
                                                                const Offset(
                                                                    1, 1),
                                                            blurStyle: BlurStyle
                                                                .normal,
                                                            blurRadius: 12,
                                                            spreadRadius: 3)
                                                      ],
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Consumer<
                                                        ProfileScreenProvider>(
                                                      builder: (context, value,
                                                          child) {
                                                        return InkWell(
                                                          onTap: () {},
                                                          child:
                                                              const CircleAvatar(
                                                            backgroundImage:
                                                                NetworkImage(
                                                                    'https://tse1.mm.bing.net/th?id=OIP.mEma0ZcipymPAHIYoIuFiAHaJa&pid=Api&P=0&h=220'),
                                                          ),
                                                        );
                                                      },
                                                    )),
                                                SizedBox(
                                                  height: height * 0.008,
                                                ),
                                                Text(
                                                  value.family[index]
                                                      ['fullName'],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline3,
                                                )
                                              ],
                                            )
                                          : Column(
                                              children: [
                                                Container(
                                                    height: height * 0.05,
                                                    width: width * 0.2,
                                                    decoration: BoxDecoration(
                                                      color: AppColors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: AppColors
                                                                .shadowColor
                                                                .withOpacity(
                                                                    0.2),
                                                            offset:
                                                                const Offset(
                                                                    1, 1),
                                                            blurStyle: BlurStyle
                                                                .normal,
                                                            blurRadius: 12,
                                                            spreadRadius: 3)
                                                      ],
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Consumer<
                                                        ProfileScreenProvider>(
                                                      builder: (context, value,
                                                          child) {
                                                        return InkWell(
                                                            onTap: () {
                                                              value
                                                                  .navigateToAddMember(
                                                                      context);
                                                            },
                                                            child: const Icon(
                                                                Icons.add));
                                                      },
                                                    )),
                                                SizedBox(
                                                  height: height * 0.013,
                                                )
                                              ],
                                            );
                                    })
                                  ],
                                ),
                              );
                      }),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(
                        'Past Appointments',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      ...List.generate(
                          3,
                          (index) => Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.01),
                                child: Container(
                                  height: height * 0.12,
                                  width: width,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.shadowColor
                                                .withOpacity(0.2),
                                            offset: const Offset(1, 1),
                                            blurStyle: BlurStyle.normal,
                                            blurRadius: 2,
                                            spreadRadius: 1)
                                      ],
                                      borderRadius:
                                          BorderRadius.circular(height * 0.01)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width * 0.01),
                                        child: CircleAvatar(
                                          radius: height * 0.05,
                                          backgroundImage: const NetworkImage(
                                              'https://tse1.mm.bing.net/th?id=OIP.mEma0ZcipymPAHIYoIuFiAHaJa&pid=Api&P=0&h=220'),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: width * 0.6,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Dr. Abram George',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline1,
                                                ),
                                                Text(
                                                  '\$ 70',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline1,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: height * 0.025,
                                                width: width * 0.12,
                                                decoration: BoxDecoration(
                                                    color: AppColors.cantainer,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            height * 0.01)),
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.favorite,
                                                        color: AppColors
                                                            .themeColor,
                                                        size: height * 0.023,
                                                      ),
                                                      Text(
                                                        '4.2',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline2!
                                                            .copyWith(
                                                                color: AppColors
                                                                    .themeColor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.04,
                                              ),
                                              Text(
                                                'Submitted',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2!
                                                    .copyWith(
                                                        color: AppColors
                                                            .themeColor),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.video_call,
                                                color: AppColors.themeColor,
                                                size: height * 0.023,
                                              ),
                                              SizedBox(
                                                width: width * 0.04,
                                              ),
                                              Text(
                                                'Audio Session',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2!
                                                    .copyWith(
                                                        color: AppColors
                                                            .themeColor),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: width * 0.6,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Hassan Khalid (Other)',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline3,
                                                ),
                                                Text(
                                                  'Monday, OCT 20, 08:00 PM',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline3,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                    ],
                  ),
                ),
              ))),
    );
  }

  Widget container(
      {required double height,
      required double width,
      required BuildContext context,
      required String text1,
      required String text2}) {
    return Container(
      height: height * 0.09,
      width: width * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height * 0.02),
          border: Border.all(color: AppColors.grey)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(text1),
          Text(
            text2,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: AppColors.grey),
          )
        ],
      ),
    );
  }
}
