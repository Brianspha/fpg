import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpg/presentation/utils/fpg_app_colors.dart';
import 'package:fpg/presentation/utils/fpg_navigation_service.dart';
import 'package:fpg/presentation/utils/fpg_routes.dart';
import 'package:fpg/presentation/utils/size_config.dart';
import 'package:one_context/one_context.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runZonedGuarded(() async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: FPGAppColors.primaryColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));
    runApp(const ProviderScope(child: MyApp()));
  }, (Object error, StackTrace stackTrace) {
    debugPrint("error in App ${stackTrace.toString()}");
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(builder: (context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: FPGRoutes.homeRoute,
        routes: FPGNavigationService.routes,
        builder: (BuildContext context, Widget? widget) {
          SizeConfig().init(context);
          return OneContext().builder(context, widget);
        },
        title: 'Flutter Demo',
        navigatorKey: FPGNavigationService.navigationKey,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
      );
    });
  }
}
