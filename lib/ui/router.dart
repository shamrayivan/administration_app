import 'package:administration_app/ui/screens/auth_screen/auth_screen.dart';
import 'package:administration_app/ui/screens/choose_treatment_screen/choose_treatment_screen.dart';
import 'package:administration_app/ui/screens/gsm_screen/gsm_screen.dart';
import 'package:administration_app/ui/screens/splash_screen/splash_screen.dart';
import 'package:administration_app/ui/screens/transport_screen/analyse_logistics_screen/analyse_logistics_screen.dart';
import 'package:administration_app/ui/screens/transport_screen/efficiency_transport_screen/efficiency_transport_screen.dart';
import 'package:administration_app/ui/screens/transport_screen/transport_screen.dart';
import 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

abstract class RouteScreen {
  static const root = '/';
  static const auth = '/auth';
  static const chooseTreatment = '/chooseTreatment';

  static const transport = '/transport';
  static const analyseLogistics = 'analyseLogistics';
  static const efficiencyTransport = 'efficiencyTransport';


  static const gsm = '/gsm';
}

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: RouteScreen.root, initial: true),
        AutoRoute(page: AuthRoute.page, path: RouteScreen.auth),
        AutoRoute(page: ChooseTreatmentRoute.page, path: RouteScreen.chooseTreatment),
        AutoRoute(page: TransportRoute.page, path: RouteScreen.transport),
        AutoRoute(page: GSMRoute.page, path: RouteScreen.gsm),
    AutoRoute(
      page: TransportRoute.page,
      path: RouteScreen.transport,
      children: [
        AutoRoute(page: AnalyseLogisticsRoute.page, path: RouteScreen.analyseLogistics),
        AutoRoute(page: EfficiencyTransportRoute.page, path: RouteScreen.efficiencyTransport),
      ],
    ),
      ];
}
