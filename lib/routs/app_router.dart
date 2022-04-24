import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_x_rockets/app/home/view/home_view.dart';
import 'package:space_x_rockets/app/splash/view/splash_view.dart';
import 'package:space_x_rockets/routs/routing_data.dart';
import 'package:space_x_rockets/routs/routs_names.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var uriData = Uri.parse(settings.name!);

    print('settings.name ${settings.name}');

    var routingData = RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );

    switch (routingData.route) {
      case RouteName.splash:
        return _getPageRoute(const SplashView(), settings);
      case RouteName.home:
        return _getPageRoute(const HomeView(), settings);
      default:
        return _getPageRoute(const SplashView(), settings);
    }
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget? child;
  final String? routeName;

  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child!,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
