import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/sing_in/bloc/signin_blocs.dart';

class SignInController {
  final BuildContext context;
  const SignInController({
    required this.context,
});

  Future<void> handleSignIn(String type) async {
    try {
      if(type== "email") {
        //BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;
        String emailAdress = state.email;
        String password = state.password;
        if(emailAdress.isEmpty) {
         toastInfo(message: "You must enter email");
        }

        if(password.isEmpty) {
          toastInfo(message: "You must enter password");
        }
        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailAdress, password: password);
           if(credential.user == null) {
              toastInfo(message: "you don't have account");
           }
           if(!credential.user!.emailVerified) {
              toastInfo(message: "you need to verify your email");
           }
            var user = credential.user;
           if(user != null) {
             //we get user verified from firebase
             toastInfo(message: "you are logged in");
             Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
           } else {
             // error getting user from firebase
              toastInfo(message: "You are not the user of this app");
           }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(message: "No user found for that email.");
          } else if (e.code == 'wrong-password') {
            toastInfo(message: "Wrong password provided for that user.");
          } else if (e.code == 'invalid-email') {
            toastInfo(message: "invalid email");
          } else {
            toastInfo(message: e.code);
          }
        }
      }
  } catch (e) {
      toastInfo(message: e.toString());
    }
}
}