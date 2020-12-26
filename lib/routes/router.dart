import 'package:fake_app_v1/pages/home_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => HomePage());
    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}
