import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  static const routeName = '/404';
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('404 Not found Screen'),
      ),
    );
  }
}

class RouteInfo {
  String routeName;
  WidgetBuilder routeBuilder;

  RouteInfo({
    required this.routeName,
    required this.routeBuilder,
  });
}

class WebNavigationRouter {
  final BuildContext context;
  final Map<String, RouteInfo> routes = {
    NotFound.routeName: RouteInfo(
      routeName: NotFound.routeName,
      routeBuilder: (BuildContext context) => const NotFound(),
    ),
  };

  WebNavigationRouter(this.context);

  void addRoutes(Map<String, Widget> routes) {
    routes.forEach((routeName, routeWidget) {
      addRoute(
          routeName: routeName,
          routeBuilder: (BuildContext context) => routeWidget);
    });
  }

  addRoute({
    required String routeName,
    required WidgetBuilder routeBuilder,
  }) {
    routes[routeName] = RouteInfo(
      routeName: routeName,
      routeBuilder: routeBuilder,
    );
  }

  MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings) {
    WidgetBuilder? notFoundBuilder = routes['/404']?.routeBuilder;
    WidgetBuilder? routeBuilder = routes[settings.name]?.routeBuilder;

    String? outputRouteName = settings.name;

    WidgetBuilder outputRouteBuilder =
        routeBuilder ?? notFoundBuilder as WidgetBuilder;

    return MaterialPageRoute(
      builder: outputRouteBuilder,
      settings: RouteSettings(name: outputRouteName),
    );
  }
}
