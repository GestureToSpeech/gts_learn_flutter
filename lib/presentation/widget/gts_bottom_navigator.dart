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
            height: AppDimens.navigatorHeight,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(3, 7),
                  blurRadius: AppDimens.navigatorBlurRadius,
                  spreadRadius: AppDimens.navigatorShadowSpreadRadius,
                  color: AppColors.shadow,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadiusDirectional.all(
                Radius.circular(AppDimens.navigatorBorderRadius),
              ),
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
        //@TODO: MORE AMOUNT INDEPENDENT SOLUTION
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          left: AppDimens.navigatorIndicatorStartingX +
              AppDimens.navigatorIndicatorSpaceBetween * router.activeIndex,
          bottom: AppDimens.navigatorIndicatorBottomOffset,
          curve: Curves.decelerate,
          child: Container(
            width: AppDimens.navigatorIndicatorSize,
            height: AppDimens.navigatorIndicatorSize,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.mainGreen,
            ),
          ),
        ),
      ],
    );
  }
}
