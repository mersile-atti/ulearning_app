import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ulearning_app/pages/home/widgets/home_page_widgets.dart';

import '../../common/values/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            homePageText(
              "Hello",
              color: AppColors.primaryThreeElementText,
            ),
            homePageText(
              "King Omam",
              top: 5,
            ),
            SizedBox(height: 20.h,),
            searchView(),
          ],
        )
      ),
    );
  }
}
