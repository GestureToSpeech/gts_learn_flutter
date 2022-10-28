import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/feature/home/cubit/home_cubit.dart';
import 'package:gts_learn/presentation/feature/home/model/carousel_item_data.dart';
import 'package:gts_learn/presentation/style/app_assets.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/theme/app_text_theme.dart';
import 'package:gts_learn/presentation/widget/app_loading.dart';
import 'package:gts_learn/presentation/widget/carousel_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) => state.maybeWhen(
        failure: () => _onFailure(context),
        orElse: () => null,
      ),
      builder: (context, state) => state.maybeWhen(
        loading: () => const AppLoading(),
        success: () => const _HomePageBody(),
        orElse: () => const SizedBox(),
      ),
    );
  }

  void _onFailure(BuildContext context) {}
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimens.isTablet
          ? const EdgeInsets.fromLTRB(
              AppDimens.d24,
              AppDimens.d40,
              AppDimens.d24,
              0,
            )
          : EdgeInsets.zero,
      child: Stack(
        children: [
          const Image(image: AssetImage(AppAssets.background)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacers.h40,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.d16),
                child: Text.rich(
                  TextSpan(
                    text: context.str.main__hi,
                    style: AppDimens.isTablet
                        ? appTextTheme().tabletHeadline2
                        : appTextTheme().headline2,
                    children: [
                      TextSpan(
                        text: ' Web Summit',
                        style: AppDimens.isTablet
                            ? appTextTheme().tabletHeadline1
                            : appTextTheme().headline1,
                      ),
                    ],
                  ),
                ),
              ),
              AppSpacers.h8,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.d16),
                child: SizedBox(
                  width: AppDimens.isTablet
                      ? MediaQuery.of(context).size.width / 2.2
                      : null,
                  child: Text(
                    context.str.home__what_you_want,
                    style: AppDimens.isTablet
                        ? appTextTheme().headline2
                        : appTextTheme().headline4,
                  ),
                ),
              ),
              if (!AppDimens.isTablet)
                CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: AppDimens.carouselAspectRatio,
                    viewportFraction: AppDimens.carouselViewFraction,
                    height: AppDimens.carouselHeight,
                    enlargeCenterPage: true,
                    disableCenter: true,
                    padEnds: false,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    grayscaleExponent: 5,
                  ),
                  items: _getCarouselItems(context),
                )
              else
                const _TabletNavigationSection(),
              const Spacer(),
              const Divider(
                indent: AppDimens.d16,
                endIndent: AppDimens.d16,
              ),
              AppSpacers.h16,
              Center(
                child: Text(
                  context.str.home__all_possibilities,
                  style: appTextTheme().bodyText1?.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _getCarouselItems(BuildContext context) {
    final carouselData = CarouselItemData.getList(context);
    return carouselData
        .map(
          (item) => CarouselItem(
            itemIndex: carouselData.indexOf(item),
            assetPath: item.assetPath,
            label: item.title,
            itemsCount: carouselData.length,
            description: item.description,
          ),
        )
        .toList();
  }
}

class _TabletNavigationSection extends StatelessWidget {
  const _TabletNavigationSection();

  @override
  Widget build(BuildContext context) {
    final carouselData = CarouselItemData.getList(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimens.d40,
      ),
      child: Row(
        children: [
          Flexible(
            child: CarouselItem(
              assetPath: carouselData[1].assetPath,
              label: carouselData[1].title,
              description: carouselData[1].description,
            ),
          ),
          Flexible(
            child: CarouselItem(
              assetPath: carouselData[0].assetPath,
              label: carouselData[0].title,
              description: carouselData[0].description,
            ),
          ),
          Flexible(
            child: CarouselItem(
              assetPath: carouselData[2].assetPath,
              label: carouselData[2].title,
              description: carouselData[2].description,
            ),
          ),
        ],
      ),
    );
  }
}
