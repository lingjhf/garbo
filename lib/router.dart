import 'package:flutter/material.dart';
import 'package:garbo/pages/home/home.dart';

class PageRoute {
  String path;
  Page page;

  PageRoute({required this.path, required this.page});
}

class GarboRouterDelegate extends RouterDelegate<PageRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageRoute> {
  final List<PageRoute> stack = [PageRoute(path: '/', page: const HomePage())];

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();
  @override
  PageRoute? get currentConfiguration =>
      PageRoute(path: '/', page: const HomePage());

  @override
  Future<void> setNewRoutePath(PageRoute configuration) async {}

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: stack.map((e) => e.page).toList(),
      onPopPage: (route, result) {
        notifyListeners();
        return true;
      },
    );
  }
}

class GarboRouteInformationParser extends RouteInformationParser<PageRoute> {
  @override
  Future<PageRoute> parseRouteInformation(
      RouteInformation routeInformation) async {
    return PageRoute(path: '/', page: const HomePage());
  }

  @override
  RouteInformation? restoreRouteInformation(PageRoute configuration) {
    return RouteInformation(location: configuration.path);
  }
}
