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
    WaybillFilterRoute.name: (routeData) {
      final args = routeData.argsAs<WaybillFilterRouteArgs>(
          orElse: () => const WaybillFilterRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WaybillFilterScreen(key: args.key),
      );
    },
    TaskFilterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TaskFilterScreen(),
      );
    },
    OrderFilterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderFilterScreen(),
      );
    },
    FullEfficiencyTransportRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<FullEfficiencyTransportRouteArgs>(
          orElse: () => FullEfficiencyTransportRouteArgs(
              fullEfficiencyTransport: pathParams.get('efficiencyTransport')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FullEfficiencyTransportScreen(
            fullEfficiencyTransport: args.fullEfficiencyTransport),
      );
    },
    EfficiencyTransportFilterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EfficiencyTransportFilterScreen(),
      );
    },
    TableFuelConsumptionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TableFuelConsumptionScreen(),
      );
    },
    FuelConsumptionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FuelConsumptionScreen(),
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

/// generated route for
/// [WaybillFilterScreen]
class WaybillFilterRoute extends PageRouteInfo<WaybillFilterRouteArgs> {
  WaybillFilterRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          WaybillFilterRoute.name,
          args: WaybillFilterRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'WaybillFilterRoute';

  static const PageInfo<WaybillFilterRouteArgs> page =
      PageInfo<WaybillFilterRouteArgs>(name);
}

class WaybillFilterRouteArgs {
  const WaybillFilterRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'WaybillFilterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [TaskFilterScreen]
class TaskFilterRoute extends PageRouteInfo<void> {
  const TaskFilterRoute({List<PageRouteInfo>? children})
      : super(
          TaskFilterRoute.name,
          initialChildren: children,
        );

  static const String name = 'TaskFilterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderFilterScreen]
class OrderFilterRoute extends PageRouteInfo<void> {
  const OrderFilterRoute({List<PageRouteInfo>? children})
      : super(
          OrderFilterRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderFilterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FullEfficiencyTransportScreen]
class FullEfficiencyTransportRoute
    extends PageRouteInfo<FullEfficiencyTransportRouteArgs> {
  FullEfficiencyTransportRoute({
    required dynamic fullEfficiencyTransport,
    List<PageRouteInfo>? children,
  }) : super(
          FullEfficiencyTransportRoute.name,
          args: FullEfficiencyTransportRouteArgs(
              fullEfficiencyTransport: fullEfficiencyTransport),
          rawPathParams: {'efficiencyTransport': fullEfficiencyTransport},
          initialChildren: children,
        );

  static const String name = 'FullEfficiencyTransportRoute';

  static const PageInfo<FullEfficiencyTransportRouteArgs> page =
      PageInfo<FullEfficiencyTransportRouteArgs>(name);
}

class FullEfficiencyTransportRouteArgs {
  const FullEfficiencyTransportRouteArgs(
      {required this.fullEfficiencyTransport});

  final dynamic fullEfficiencyTransport;

  @override
  String toString() {
    return 'FullEfficiencyTransportRouteArgs{fullEfficiencyTransport: $fullEfficiencyTransport}';
  }
}

/// generated route for
/// [EfficiencyTransportFilterScreen]
class EfficiencyTransportFilterRoute extends PageRouteInfo<void> {
  const EfficiencyTransportFilterRoute({List<PageRouteInfo>? children})
      : super(
          EfficiencyTransportFilterRoute.name,
          initialChildren: children,
        );

  static const String name = 'EfficiencyTransportFilterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TableFuelConsumptionScreen]
class TableFuelConsumptionRoute extends PageRouteInfo<void> {
  const TableFuelConsumptionRoute({List<PageRouteInfo>? children})
      : super(
          TableFuelConsumptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'TableFuelConsumptionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FuelConsumptionScreen]
class FuelConsumptionRoute extends PageRouteInfo<void> {
  const FuelConsumptionRoute({List<PageRouteInfo>? children})
      : super(
          FuelConsumptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'FuelConsumptionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
