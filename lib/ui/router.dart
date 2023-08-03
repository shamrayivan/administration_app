import 'package:administration_app/ui/screens/auth_screen/auth_screen.dart';
import 'package:administration_app/ui/screens/splash_screen/splash_screen.dart';
import 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

abstract class RouteScreen {
  static const root = '/';
  static const auth = '/auth';
}

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: RouteScreen.root, initial: true),
        AutoRoute(page: AuthRoute.page, path: RouteScreen.auth),
      ];
}
