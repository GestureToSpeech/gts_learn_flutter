import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gts_learn/app/router/app_router.dart';
import 'package:gts_learn/presentation/widget/gts_app_bar.dart';
import 'package:gts_learn/presentation/widget/gts_bottom_navigator.dart';

class CorePage extends StatelessWidget {
  const CorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GTSAppBar(),
      body: AutoTabsScaffold(
        routes: const [
          HomeRouter(),
          DictionaryRouter(),
          LessonsRouter(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) => GTSBottomNavigator(
          router: tabsRouter,
        ),
      ),
    );
  }
}
