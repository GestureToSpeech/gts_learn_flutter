import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:gts_learn/app/router/app_router.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/style/app_assets.dart';

class CarouselItemData {
  CarouselItemData({
    required this.assetPath,
    required this.title,
    required this.description,
    required this.onPressed,
  });

  factory CarouselItemData.lessons(BuildContext context) => CarouselItemData(
        assetPath: AppAssets.homeLessons,
        title: context.str.main__lessons,
        description: context.str.home__lessons_desc,
        onPressed: () => context.navigateTo(
          const LessonsRouter(
            children: [LessonsRoute()],
          ),
        ),
      );

  factory CarouselItemData.dictionary(BuildContext context) => CarouselItemData(
        assetPath: AppAssets.homeDictionary,
        title: context.str.main__dictionary,
        description: context.str.home__dictionary_desc,
        onPressed: () => context
            .navigateTo(const DictionaryRouter(children: [DictionaryRoute()])),
      );

  factory CarouselItemData.ranking(BuildContext context) => CarouselItemData(
        assetPath: AppAssets.homeRanking,
        title: context.str.main__user_ranking,
        description: context.str.home__user_ranking_desc,
        onPressed: () => null,
      );

  static List<CarouselItemData> getList(BuildContext context) => [
        CarouselItemData.lessons(context),
        CarouselItemData.dictionary(context),
        CarouselItemData.ranking(context),
      ];

  final String assetPath;
  final String title;
  final String description;
  final VoidCallback onPressed;
}
