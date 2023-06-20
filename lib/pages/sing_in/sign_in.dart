import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/sing_in/bloc/signin_blocs.dart';
import 'package:ulearning_app/pages/sing_in/bloc/signin_events.dart';
import 'package:ulearning_app/pages/sing_in/bloc/signin_states.dart';
import 'package:ulearning_app/pages/sing_in/signin_controller.dart';
import 'package:ulearning_app/pages/sing_in/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          return  Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar:buildAppBar("Sign In"),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildThirdPartyLogin(context),
                      Center(child: reusableText("Or use your email account to login")),
                      Container(
                        margin: EdgeInsets.only(top: 36.h),
                        padding: EdgeInsets.only(left: 25.w, right: 25.w),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              reusableText("Email"),
                              SizedBox(height: 5.h),
                              reusableTextField("Enter your email", "Email", "user",
                                  (value) {
                                    context.read<SignInBloc>().add(EmailEvent(value));
                                  }
                              ),
                              reusableText("Password"),
                              SizedBox(height: 5.h),
                              reusableTextField("Enter your password", "Password", "lock",
                                      (value) {
                                    context.read<SignInBloc>().add(PasswordEvent(value));
                                  }
                              ),
                            ]
                        ),
                      ),
                      forgotPassword(),
                      buildLoginAndRegButton("Login", "login", () {
                        SignInController(context: context).handleSignIn("email");
                      }),
                      buildLoginAndRegButton("Sign Up", "register", () {
                        Navigator.of(context).pushNamed("/register");
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
