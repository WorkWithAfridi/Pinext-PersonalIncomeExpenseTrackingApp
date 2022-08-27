import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pinext/app/screens/add_pinext_card/add_pinext_card.dart';
import 'package:pinext/app/screens/add_transaction/add_transaction.dart';
import 'package:pinext/app/screens/home/homeframe.dart';

import '../../screens/login/login_screen.dart';
import '../../screens/signup/signup_screen.dart';
import '../../screens/splash/splash_screen.dart';

class ROUTECONTROLLER {
  static Route<dynamic> routeController(RouteSettings settings) {
    switch (settings.name) {
      case ROUTES.getSplashRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case ROUTES.getLoginRoute:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case ROUTES.getSignupRoute:
        return MaterialPageRoute(
          builder: (context) => const SignupScreen(),
        );
      case ROUTES.getHomeframeRoute:
        return MaterialPageRoute(
          builder: (context) => const Homeframe(),
        );
      case ROUTES.getAddTransactionsRoute:
        return MaterialPageRoute(
          builder: (context) => const AddTransactionScreen(),
        );
      case ROUTES.getAddPinextCardRoute:
        return MaterialPageRoute(
          builder: (context) => const AddPinextCardScreen(),
        );
      default:
        log(settings.name.toString());
        throw ("Not a valid route ");
    }
  }
}

class ROUTES {
  static const getSplashRoute = '/';
  static const getLoginRoute = '/login';
  static const getSignupRoute = '/signup';
  static const getHomeframeRoute = '/homeframe';
  static const getAddTransactionsRoute = '/homeframe/add_transactions';
  static const getAddPinextCardRoute = '/homeframe/add_pinext_card';
}
