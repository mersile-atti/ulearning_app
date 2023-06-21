import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/pages/application/bloc/app_blocs.dart';
import 'package:ulearning_app/pages/register/bloc/register_blocs.dart';

import '../../global.dart';
import '../../pages/application/application_page.dart';
import '../../pages/register/register.dart';
import '../../pages/sing_in/bloc/signin_blocs.dart';
import '../../pages/sing_in/sign_in.dart';
import '../../pages/welcome/bloc/welcome_blocs.dart';
import '../../pages/welcome/welcome.dart';



class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(route: AppRoutes.INITIAL, page: const Welcome(), bloc: BlocProvider(create: (_) => WelcomeBloc()),),
      PageEntity(route: AppRoutes.APPLICATION, page: const ApplicationPage(), bloc: BlocProvider(create: (_) => AppBloc())),
      PageEntity(route: AppRoutes.SIGN_IN, page: const SignIn(), bloc: BlocProvider(create: (_) => SignInBloc()),),
      PageEntity(route: AppRoutes.REGISTER, page: const Register(), bloc: BlocProvider(create: (_) => RegisterBlocs()),),
    ];
  }


  // return all blocs in routes
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      if (bloc.bloc != null) {
        blocProviders.add(bloc.bloc);
      }
    }
    return blocProviders;
  }

  // a modal that covers entire screen as we click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
   if (settings.name != null) {
     // check for routes names match when navigator gets triggered
     var result = routes().where((element) => element.route == settings.name);
     if(result.isNotEmpty) {
       // if route name matches then return the page
       bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
       if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isUserLoggedIn = Global.storageService.getIsLoggedIn();
          if (isUserLoggedIn) {
            return MaterialPageRoute(builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(builder: (_) => const SignIn(), settings: settings);
        }
       return MaterialPageRoute(builder: (_) => result.first.page, settings: settings);
     }

   }
   return MaterialPageRoute(builder: (_) => const SignIn(), settings: settings);
  }

}



// Unify BlocProvider and routes and pages
class PageEntity {
String route;
Widget page;
dynamic bloc;

PageEntity({
  required this.route,
  required this.page,
  this.bloc,
});

}