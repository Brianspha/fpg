import 'package:flutter/cupertino.dart';
import 'package:fpg/presentation/utils/fpg_routes.dart';
import 'package:fpg/presentation/views/fpg_home_view.dart';
import 'package:one_context/one_context.dart';

class FPGNavigationService {
  static final GlobalKey<NavigatorState> navigationKey = OneContext().key;

  static Map<String, WidgetBuilder> routes = {FPGRoutes.homeRoute: (BuildContext context) => const FPGHomeView()};
  static void navigateTo(String route) {
    OneContext().pushNamed(route);
  }
}
