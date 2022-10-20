import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gts_learn/app/router/app_router.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/widget/gts_app_bar.dart';

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
        bottomNavigationBuilder: (_, tabsRouter) => BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: context.str.main__home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.abc),
              label: context.str.main__dictionary,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.library_books),
              label: context.str.main__lessons,
            ),
          ],
        ),
      ),
    );
  }
}
