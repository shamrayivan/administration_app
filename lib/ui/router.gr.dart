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
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SplashScreen(key: args.key),
      );
    },
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AuthScreen(),
      );
    },
    ChooseTreatmentRoute.name: (routeData) {
      final args = routeData.argsAs<ChooseTreatmentRouteArgs>(
          orElse: () => const ChooseTreatmentRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChooseTreatmentScreen(key: args.key),
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
    TableFuelConsumptionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TableFuelConsumptionScreen(),
      );
    },
    FuelConsumptionRoute.name: (routeData) {
      final args = routeData.argsAs<FuelConsumptionRouteArgs>(
          orElse: () => const FuelConsumptionRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FuelConsumptionScreen(key: args.key),
      );
    },
    EfficiencyTransportFilterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EfficiencyTransportFilterScreen(),
      );
    },
    GraphFuelConsumptionRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<GraphFuelConsumptionRouteArgs>(
          orElse: () => GraphFuelConsumptionRouteArgs(
                mode: pathParams.getInt('mode'),
                data: pathParams.getString('data'),
              ));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GraphFuelConsumptionScreen(
          mode: args.mode,
          data: args.data,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsScreen(),
      );
    },
    FilterGraphFuelConsumptionRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<FilterGraphFuelConsumptionRouteArgs>(
          orElse: () => FilterGraphFuelConsumptionRouteArgs(
                mode: pathParams.getInt('mode'),
                data: pathParams.getString('data'),
              ));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FilterGraphFuelConsumptionScreen(
          key: args.key,
          mode: args.mode,
          data: args.data,
        ),
      );
    },
    FullTableFuelConsumptionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FullTableFuelConsumptionScreen(),
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
class SplashRoute extends PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SplashRoute.name,
          args: SplashRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<SplashRouteArgs> page = PageInfo<SplashRouteArgs>(name);
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key}';
  }
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
class ChooseTreatmentRoute extends PageRouteInfo<ChooseTreatmentRouteArgs> {
  ChooseTreatmentRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ChooseTreatmentRoute.name,
          args: ChooseTreatmentRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ChooseTreatmentRoute';

  static const PageInfo<ChooseTreatmentRouteArgs> page =
      PageInfo<ChooseTreatmentRouteArgs>(name);
}

class ChooseTreatmentRouteArgs {
  const ChooseTreatmentRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ChooseTreatmentRouteArgs{key: $key}';
  }
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
class FuelConsumptionRoute extends PageRouteInfo<FuelConsumptionRouteArgs> {
  FuelConsumptionRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          FuelConsumptionRoute.name,
          args: FuelConsumptionRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'FuelConsumptionRoute';

  static const PageInfo<FuelConsumptionRouteArgs> page =
      PageInfo<FuelConsumptionRouteArgs>(name);
}

class FuelConsumptionRouteArgs {
  const FuelConsumptionRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'FuelConsumptionRouteArgs{key: $key}';
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
/// [GraphFuelConsumptionScreen]
class GraphFuelConsumptionRoute
    extends PageRouteInfo<GraphFuelConsumptionRouteArgs> {
  GraphFuelConsumptionRoute({
    required int mode,
    required String data,
    List<PageRouteInfo>? children,
  }) : super(
          GraphFuelConsumptionRoute.name,
          args: GraphFuelConsumptionRouteArgs(
            mode: mode,
            data: data,
          ),
          rawPathParams: {
            'mode': mode,
            'data': data,
          },
          initialChildren: children,
        );

  static const String name = 'GraphFuelConsumptionRoute';

  static const PageInfo<GraphFuelConsumptionRouteArgs> page =
      PageInfo<GraphFuelConsumptionRouteArgs>(name);
}

class GraphFuelConsumptionRouteArgs {
  const GraphFuelConsumptionRouteArgs({
    required this.mode,
    required this.data,
  });

  final int mode;

  final String data;

  @override
  String toString() {
    return 'GraphFuelConsumptionRouteArgs{mode: $mode, data: $data}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FilterGraphFuelConsumptionScreen]
class FilterGraphFuelConsumptionRoute
    extends PageRouteInfo<FilterGraphFuelConsumptionRouteArgs> {
  FilterGraphFuelConsumptionRoute({
    Key? key,
    required int mode,
    required String data,
    List<PageRouteInfo>? children,
  }) : super(
          FilterGraphFuelConsumptionRoute.name,
          args: FilterGraphFuelConsumptionRouteArgs(
            key: key,
            mode: mode,
            data: data,
          ),
          rawPathParams: {
            'mode': mode,
            'data': data,
          },
          initialChildren: children,
        );

  static const String name = 'FilterGraphFuelConsumptionRoute';

  static const PageInfo<FilterGraphFuelConsumptionRouteArgs> page =
      PageInfo<FilterGraphFuelConsumptionRouteArgs>(name);
}

class FilterGraphFuelConsumptionRouteArgs {
  const FilterGraphFuelConsumptionRouteArgs({
    this.key,
    required this.mode,
    required this.data,
  });

  final Key? key;

  final int mode;

  final String data;

  @override
  String toString() {
    return 'FilterGraphFuelConsumptionRouteArgs{key: $key, mode: $mode, data: $data}';
  }
}

/// generated route for
/// [FullTableFuelConsumptionScreen]
class FullTableFuelConsumptionRoute extends PageRouteInfo<void> {
  const FullTableFuelConsumptionRoute({List<PageRouteInfo>? children})
      : super(
          FullTableFuelConsumptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'FullTableFuelConsumptionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
