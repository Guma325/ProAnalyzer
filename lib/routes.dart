import 'package:flutter/material.dart';
import 'package:myapp/pages/login_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list = <String, WidgetBuilder>{
    '/home': (_) => const LoginPage(),
  };

  static String initial = '/home';

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}