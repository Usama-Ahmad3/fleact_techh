import 'package:fleact_tech/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(right: width * 0.018),
      child: Stack(
        children: [
          Container(
            height: height * 0.18,
            width: width * 0.8,
            decoration: BoxDecoration(
                color: AppColors.homeContainer,
                borderRadius: BorderRadius.circular(height * 0.02)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03, vertical: height * 0.015),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '02 July 2022',
                        style: TextStyle(color: AppColors.white),
                      ),
                      Icon(
                        Icons.bookmark_border,
                        color: AppColors.white,
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Text(
                    'COVID- 19 Vaccine',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                      'Official public service announcement on coronavirus from the world health',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: AppColors.white)),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: height * 0.018,
              right: width * 0.045,
              child: Icon(
                Icons.arrow_forward,
                size: height * 0.032,
                color: AppColors.white,
              ))
        ],
      ),
    );
  }
}
