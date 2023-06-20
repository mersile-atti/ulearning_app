import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/flutter_toast.dart';
import 'bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({
    required this.context,
  });

  Future<void> handleEmailRegister() async {
    final state  = context.read<RegisterBlocs>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;

    if(userName.isEmpty) {
      toastInfo(message: "User name can not be empty");
      return;
    }
    if(email.isEmpty) {
      toastInfo(message: "Email can not be empty");
      return;
    }
    if(password.isEmpty) {
      toastInfo(message: "Password can not be empty");
      return;
    }
    if(confirmPassword.isEmpty) {
      toastInfo(message: "You must confirm password");
      return;
    }

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
      if(credential.user != null) {
        await credential.user!.sendEmailVerification();
        await credential.user!.updateDisplayName(userName);
        toastInfo(message: "Please check your email to verify your account");
        Navigator.of(context).pop();
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(message: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(message: "The account already exists for that email.");
      } else if (e.code == 'invalid-email') {
        toastInfo(message: "invalid email");
      } else {
        toastInfo(message: e.code);
      }
    } catch (e) {
      toastInfo(message: e.toString());
    }
  }

}