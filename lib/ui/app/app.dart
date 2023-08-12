import 'package:administration_app/di/di.dart';
import 'package:administration_app/ui/app/app_wm.dart';
import 'package:administration_app/ui/router.dart';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mwwm/mwwm.dart';

class App extends CoreMwwmWidget {
  App({
    Key? key,
  }) : super(
          key: key,
          widgetModelBuilder: (_) => AppWM(),
        );

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends WidgetState<AppWM> {
  final rootScaffoldMessengerKey = getIt<GlobalKey<ScaffoldMessengerState>>();
  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      locale: const Locale('ru', 'RU'),
      theme: ThemeData(
        fontFamily: 'Helvetica',
      ),
      supportedLocales: const [Locale('ru', 'RU')],
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        return MediaQuery(
          data: mediaQueryData.copyWith(textScaleFactor: 1.0),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
