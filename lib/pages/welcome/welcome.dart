import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_states.dart';

import '../../common/values/colors.dart';
import 'bloc/welcome_events.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context)
                          .add(WelcomeEvent());
                    },
                    children: [
                      _page(
                        1,
                        context,
                        "First See Learning",
                        "Next",
                        "Forget about a for of paper all knowledge is in one learning",
                        "assets/images/reading.png",
                      ),
                      _page(
                        2,
                        context,
                        "Connect With Everyone",
                        "Next",
                        "Always keep in touch with your friends and teachers. Let's get connected",
                        "assets/images/boy.png",
                      ),
                      _page(
                        3,
                        context,
                        "Always Fascinated Learning",
                        "Get Started",
                        "Anywhere, anytime, and anyplace. The time is at your hand. Let's get started",
                        "assets/images/man.png",
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 100.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: AppColors.primaryThreeElementText,
                        activeColor: AppColors.primaryElement,
                        size: const Size.square(8.0),
                        activeSize: const Size(20, 10),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),

                    ),
                  )
                ],
              ),
            );
          },
        )
      ),
    );
  }

  Widget _page(int index, BuildContext context, String title, String buttonName, String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
            width: 345.w,
            height: 345.w,
            child: Image.asset(
                imagePath,
                fit: BoxFit.cover),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.primaryText,
            ),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.primarySecondaryElementText,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if(index < 3) {
              pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            }
            else {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/sign_in', (route) => false
              );
          }
          },
          child: Container(
              width: 325.w,
              height: 50.h,
              margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0,1), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Text(buttonName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    )
                ),
              )
          ),
        ),
      ],
    );
  }
}
