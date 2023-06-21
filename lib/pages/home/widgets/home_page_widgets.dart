import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/person.png"),
                )
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageText(String text, {Color color=AppColors.primaryText, int top=20}) {
  return Container(
    margin: EdgeInsets.only(top:top.h),
    child: Text(text,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

//Widget searchView

Widget searchView() {
  return Container(
    margin: EdgeInsets.only(top: 20.h),
    child: Row(
      children: [
        Container(
          width: 280.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(
              color: AppColors.primaryFourElementText,
            ),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.w),
                child: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset("assets/icons/search.png"),
                ),
              ),
              Container(
                width: 240.w,
                height: 40.h,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                    hintText: "Search your course",
                    hintStyle: TextStyle(
                      color: AppColors.primarySecondaryElementText,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    color: AppColors.primaryText,
                  ),
                  autocorrect: false,
                  obscureText: false,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(13.w)),
              border: Border.all(
                color: AppColors.primaryElement,
              ),
            ),
            child: Image.asset("assets/icons/options.png"),
          ),
        ),
      ],
    ),
  );
}

