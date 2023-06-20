import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

AppBar buildAppBar(String text) {

  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        // height defines the thickness of the line
        height: 1.0,
      ),
    ),
    title: Center(
      child: Text(text,
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}

//we need context to access the bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
        top: 40.h,
    bottom: 20.h),
      padding: EdgeInsets.only(
        left: 25.w,
        right: 25.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _reusableIcon("google"),
          _reusableIcon("apple"),
          _reusableIcon("facebook"),
        ],
      ),
  );
}

Widget _reusableIcon (String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset(
        "assets/icons/$iconName.png",
      ),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 5.h,
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black.withOpacity(0.5),
      ),
    ),
  );
}

Widget reusableTextField(String hintText, String textType, String iconName,
    void Function(String value)? func
    ) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 20.h,
    ),
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
      border: Border.all(
        color: AppColors.primaryFourElementText,
      ),
    ),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          margin: EdgeInsets.only(left: 17.w),
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            onChanged: (value) =>
              func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.primarySecondaryElementText,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                )
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                )
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                )
              ),
              focusedBorder: const OutlineInputBorder(
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
            obscureText: textType == "Password" ? true : false,
          ),
        ),
      ]
    ),
  );
}

Widget forgotPassword() {
  return Container(
    margin: EdgeInsets.only(
      left: 25.w,
    ),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot Password?",
        style: TextStyle(
          fontSize: 14.sp,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
          fontWeight: FontWeight.normal,
          color: AppColors.primaryText,
        ),
      ),
    ),
  );
}

Widget buildLoginAndRegButton(String buttonName, String buttonType,
    void Function()? func
    ) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(
        left: 25.w,
        right: 25.w,
        top: buttonType == "Login"
            ? 40.h
            : 20.h,
      ),
      decoration: BoxDecoration(
        color: buttonType == "login"
            ? AppColors.primaryElement
            : AppColors.primaryBackground,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(
          color: buttonType == "login"
              ? Colors.transparent
              : AppColors.primaryFourElementText),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: buttonType=="login"
                ? AppColors.primaryBackground
                : AppColors.primaryText,
          ),
        ),
      ),
    ),
  );
}