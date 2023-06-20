import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/register/bloc/register_blocs.dart';
import 'package:ulearning_app/pages/sing_in/bloc/signin_blocs.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
    BlocProvider(
      create: (context) => WelcomeBloc(),
    ),
    //BlocProvider(lazy: false, create: (context) => AppBlocs(),),
    BlocProvider(
      create: (context) => SignInBloc(),
    ),
    BlocProvider(create: (context) => RegisterBlocs(),),
  ];
}