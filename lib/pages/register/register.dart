import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/register/bloc/register_blocs.dart';
import 'package:ulearning_app/pages/register/bloc/register_events.dart';
import 'package:ulearning_app/pages/register/bloc/register_states.dart';
import 'package:ulearning_app/pages/register/register_controller.dart';

import '../sing_in/widgets/sign_in_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar:buildAppBar("Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(child: reusableText("Enter your information below & free sign up")),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("User Name"),
                          reusableTextField("Enter your user name", "Name", "user",
                                  (value) {
                                 context.read<RegisterBlocs>().add(UserNameEvent(value));
                              }
                          ),
                          reusableText("Email"),
                          reusableTextField("Enter your email", "Email", "user",
                                  (value) {
                                context.read<RegisterBlocs>().add(EmailEvent(value));
                              }
                          ),
                          reusableText("Password"),
                          reusableTextField("Enter your password", "Password", "lock",
                                  (value) {
                                context.read<RegisterBlocs>().add(PasswordEvent(value));
                              }
                          ),
                          reusableText("Confirm Password"),
                          reusableTextField("Confirm your password", "Password", "lock",
                                  (value) {
                                context.read<RegisterBlocs>().add(ConfirmPasswordEvent(value));
                              }
                          ),
                        ]
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: reusableText("By clicking Sign Up, you agree to our Terms, Data Policy and Cookie Policy.")),
                  buildLoginAndRegButton("Sign Up", "login", () {
                    //Navigator.of(context).pushNamed("register");
                    RegisterController(context: context).handleEmailRegister();
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
