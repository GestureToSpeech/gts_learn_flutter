import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/app/router/app_router.dart';
import 'package:gts_learn/presentation/feature/home/cubit/home_cubit.dart';
import 'package:gts_learn/presentation/feature/home/model/carousel_item_data.dart';
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: AppDimens.d8),
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: AppDimens.carouselAspectRatio,
              viewportFraction: AppDimens.carouselViewFraction,
              height: AppDimens.carouselHeight,
              enlargeCenterPage: true,
              disableCenter: true,
              padEnds: false,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: _getCarouselItems(context),
          ),
        ),
        AppSpacers.h40,
        ElevatedButton(
          onPressed: () => _onDictionaryButtonPressed(context),
          child: Text(
            'Navigate to dictionary',
            style: appTextTheme().headline2,
          ),
        ),
        AppSpacers.h8,
        ElevatedButton(
          onPressed: () => _onLessonsButtonPressed(context),
          child: const Text('Navigate to lessons'),
        ),
      ],
    );
  }

  void _onDictionaryButtonPressed(BuildContext context) =>
      context.navigateTo(const DictionaryRouter(children: [DictionaryRoute()]));

  void _onLessonsButtonPressed(BuildContext context) =>
      context.navigateTo(const LessonsRouter(children: [LessonsRoute()]));

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
