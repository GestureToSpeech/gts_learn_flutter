import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/app/router/app_router.dart';
import 'package:gts_learn/presentation/feature/home/cubit/home_cubit.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
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
      mainAxisAlignment: MainAxisAlignment.center,
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
            items: _getCarouselItems(),
          ),
        ),
        ElevatedButton(
          onPressed: () => _onDictionaryButtonPressed(context),
          child: const Text('Navigate to dictionary'),
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

  List<Widget> _getCarouselItems() => imgList
      .map(
        (item) => CarouselItem(
          itemIndex: imgList.indexOf(item),
          itemUrl: item,
          label: 'Dictionary',
          itemsCount: imgList.length,
        ),
      )
      .toList();
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1952&q=80',
];
