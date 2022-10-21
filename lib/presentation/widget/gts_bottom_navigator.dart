import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/style/app_colors.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/style/app_icons.dart';

class GTSBottomNavigator extends StatelessWidget {
  const GTSBottomNavigator({super.key, required this.router});

  final TabsRouter router;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.d24,
            vertical: AppDimens.d24,
          ),
          child: Container(
            height: 75,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadiusDirectional.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(3, 7),
                  blurRadius: 14,
                  spreadRadius: 5,
                  color: AppColors.shadow,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius:
                  const BorderRadiusDirectional.all(Radius.circular(10)),
              child: BottomNavigationBar(
                currentIndex: router.activeIndex,
                onTap: router.setActiveIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(AppIcons.home),
                    label: context.str.main__home,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(AppIcons.dictionary),
                    label: context.str.main__dictionary,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(AppIcons.lessons),
                    label: context.str.main__lessons,
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.mainGreen,
          ),
        ),
      ],
    );
  }
}
