// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    GSMRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GSMScreen(),
      );
    },
    EfficiencyTransportRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EfficiencyTransportScreen(),
      );
    },
    AnalyseLogisticsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AnalyseLogisticsScreen(),
      );
    },
    TransportRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TransportScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SplashScreen(),
      );
    },
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AuthScreen(),
      );
    },
    ChooseTreatmentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChooseTreatmentScreen(),
      );
    },
  };
}

/// generated route for
/// [GSMScreen]
class GSMRoute extends PageRouteInfo<void> {
  const GSMRoute({List<PageRouteInfo>? children})
      : super(
          GSMRoute.name,
          initialChildren: children,
        );

  static const String name = 'GSMRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EfficiencyTransportScreen]
class EfficiencyTransportRoute extends PageRouteInfo<void> {
  const EfficiencyTransportRoute({List<PageRouteInfo>? children})
      : super(
          EfficiencyTransportRoute.name,
          initialChildren: children,
        );

  static const String name = 'EfficiencyTransportRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AnalyseLogisticsScreen]
class AnalyseLogisticsRoute extends PageRouteInfo<void> {
  const AnalyseLogisticsRoute({List<PageRouteInfo>? children})
      : super(
          AnalyseLogisticsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnalyseLogisticsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TransportScreen]
class TransportRoute extends PageRouteInfo<void> {
  const TransportRoute({List<PageRouteInfo>? children})
      : super(
          TransportRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransportRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChooseTreatmentScreen]
class ChooseTreatmentRoute extends PageRouteInfo<void> {
  const ChooseTreatmentRoute({List<PageRouteInfo>? children})
      : super(
          ChooseTreatmentRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseTreatmentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
