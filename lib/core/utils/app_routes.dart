import 'package:flutter/material.dart';

import '../../features/auth/sign_in/presentation/pages/sign_in.dart';

class AppRoutes {

  static Map<String, WidgetBuilder> routes = {

    SignIn.routeName: (context) =>  SignIn(),


  };
}