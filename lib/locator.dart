import 'package:get_it/get_it.dart';
import 'package:space_x_rockets/app/home/controller/home_controller.dart';
import 'package:space_x_rockets/app/splash/view_model/splash_view_model.dart';
import 'package:space_x_rockets/services/api_service.dart';
import 'package:space_x_rockets/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => NavigationService());
  initSingleton();
  locator.registerFactory(() => SplashViewModel());
  locator.registerFactory(() => HomeViewModel());
}

void initSingleton() {
  locator<ApiService>();
}
