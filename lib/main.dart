import 'package:flutter/material.dart';
import 'package:garbo/router.dart';
import 'package:garbo/theme.dart';

void main() {
  runApp(const GarboApp());
}

class GarboApp extends StatefulWidget {
  const GarboApp({super.key});

  @override
  State<StatefulWidget> createState() => _GarboAppState();
}

class _GarboAppState extends State<GarboApp> {
  final GarboRouterDelegate _garboRouterDelegate = GarboRouterDelegate();
  final GarboRouteInformationParser _garboRouteInformationParser =
      GarboRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        extensions: <ThemeExtension<dynamic>>{GarboTheme()},
      ),
      routerDelegate: _garboRouterDelegate,
      routeInformationParser: _garboRouteInformationParser,
    );
  }
}
