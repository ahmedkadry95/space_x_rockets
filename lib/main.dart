import 'package:flutter/material.dart';
import 'package:space_x_rockets/locator.dart';
import 'package:space_x_rockets/routs/app_router.dart';
import 'package:space_x_rockets/routs/routs_names.dart';
import 'package:space_x_rockets/services/navigation_service.dart';

void main() async {
  setupLocator();

  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpaceX',
      initialRoute: RouteName.splash,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
