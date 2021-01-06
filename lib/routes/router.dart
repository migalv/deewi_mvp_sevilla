import 'package:mvp_sevilla/pages/cuisine_page.dart';
import 'package:mvp_sevilla/pages/dish_page.dart';
import 'package:mvp_sevilla/pages/faqs_page.dart';
import 'package:mvp_sevilla/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:mvp_sevilla/pages/checkout_page.dart';
import 'package:mvp_sevilla/pages/payment_error_page.dart';
import 'package:mvp_sevilla/pages/thank_you_page.dart';
import 'package:mvp_sevilla/routes/route_names.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final uri = Uri.parse(settings.name);
    final String routeName = uri.path;
    Map<String, String> args = uri.queryParameters ?? {};
    Widget child;

    if (args.isEmpty) args = settings.arguments as Map<String, String> ?? {};

    switch (routeName) {
      case RouteNames.HOME_ROUTE:
        child = HomePage();
        break;
      case RouteNames.CHECKOUT_ROUTE:
        child = CheckoutPage();
        break;
      case RouteNames.CUISINE_ROUTE:
        child = CuisinePage(cuisineId: args["id"]);
        break;
      case RouteNames.DISH_ROUTE:
        child = DishPage(dishId: args["id"]);
        break;
      case RouteNames.FAQS_ROUTE:
        child = FAQsPage();
        break;
      case RouteNames.SUCCESS_ROUTE:
        child = ThankYouPage();
        break;
      case RouteNames.CANCEL_ROUTE:
        child = PaymentErrorPage();
        break;
      default:
        child = HomePage();
    }

    return _getPageRoute(child, uri.toString());
  }

  static Route _getPageRoute(Widget child, String routeName) {
    return MaterialPageRoute(
      builder: (context) => child,
      settings: RouteSettings(name: routeName),
    );
  }
}
