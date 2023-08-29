import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fpg/presentation/utils/fpg_app_colors.dart';
import 'package:fpg/presentation/utils/fpg_routes.dart';
import 'package:fpg/presentation/views/fpg_home_view.dart';
import 'package:one_context/one_context.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

import '../views/fpg_past_steps_view.dart';
import '../views/fpg_public_goods_view.dart';

class FPGNavigationService {
  static final GlobalKey<NavigatorState> navigationKey = OneContext().key;

  static Map<String, WidgetBuilder> routes = {
    FPGRoutes.homeRoute: (BuildContext context) => const FPGHomeView(),
    FPGRoutes.publicGoodsRoute: (BuildContext context) => const FPGPublicGoodsView(),
    FPGRoutes.pasteStepsRoute: (BuildContext context) => const FPGPastStepsView(),
  };
  static Map<String, Widget> routesWithView = {
    FPGRoutes.homeRoute: const FPGHomeView(),
    FPGRoutes.publicGoodsRoute: const FPGPublicGoodsView(),
    FPGRoutes.pasteStepsRoute: const FPGPastStepsView()
  };

  static void navigateTo(String route) {
    OneContext().push(TurnPageRoute(
      overleafColor: FPGAppColors.white,
      animationTransitionPoint: 0.5,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      builder: (context) => routesWithView[route]!,
    ));
  }
}
