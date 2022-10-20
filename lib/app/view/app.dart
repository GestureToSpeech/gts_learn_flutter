import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gts_learn/app/router/app_router.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/theme/app_theme.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return AppView(
      router: _appRouter,
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key, required this.router});

  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
      theme: AppTheme.appThemeData,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
