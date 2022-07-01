import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plan_de_financement/Screens/Login/ForgetPasswordScreen.dart';
import 'package:plan_de_financement/Screens/Login/LoginScreen.dart';

import 'Screens/Client/Dashboard/ListDesClientScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/second':
        // Validation of correct data type
        // if (args is String) {
        //   return MaterialPageRoute(
        //     builder: (_) => MyHomePage(
        //       data: args,
        //       title: '',
        //     ),
        //   );
        // }

        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      case '/forgetPassword':
        return
            //  MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
            PageTransition(
                type: PageTransitionType.rightToLeft,
                child: ForgetPasswordScreen());
      case '/Login':
        return
            //  MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
            PageTransition(
                type: PageTransitionType.fade, child: LoginScreens());

      case '/TableauDeBoard':
        return
            //  MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
            PageTransition(
                type: PageTransitionType.leftToRight, child: ListDesClient());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
