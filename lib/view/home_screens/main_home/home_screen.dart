import 'package:fleact_tech/res/colors/app_colors.dart';
import 'package:fleact_tech/res/common_widgets/button_widget.dart';
import 'package:fleact_tech/view/home_screens/main_home/container_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: const Color(0xff86022e),
      appBar: PreferredSize(
        preferredSize: Size(width, height * 0.25),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.07,
              ),
              Icon(
                Icons.notes,
                color: AppColors.white,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                'Hey, Emily',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: AppColors.white),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Text(
                'Wanna book appointment',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: AppColors.white),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Center(
                  child: ButtonWidget(text: 'Book Appointment', onTap: () {})),
            ],
          ),
        ),
      ),
      body: Container(
          color: const Color(0xff86022e),
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
                      const Text('You have incoming appointment!'),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      SizedBox(
                        height: height * 0.07,
                        width: width,
                        child: Row(
                          children: [
                            SizedBox(
                              width: width * 0.01,
                            ),
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://th.bing.com/th?id=OIP.rzvJIIoK4rs7kpN44Q5YegHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2'),
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
                            const Text('Dr. Emma Mia'),
                            const Spacer(),
                            Container(
                              height: height * 0.04,
                              width: width * 0.3,
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.border),
                                  borderRadius:
                                      BorderRadius.circular(height * 0.01)),
                              child: Center(
                                  child: Text(
                                'Attend Now',
                                style: TextStyle(color: AppColors.border),
                              )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: height * 0.07,
                        width: width,
                        decoration: BoxDecoration(
                            color: AppColors.cantainer,
                            borderRadius:
                                BorderRadius.circular(height * 0.035)),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.05),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.calendar_month),
                                  Text('Monday, May 12'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.access_time_rounded),
                                  Text('11:00 - 12:00 Am')
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Health Articles'), Text('See All')],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                                4, (index) => const ContainerWidget())
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))),
    );
  }
}
