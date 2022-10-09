import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/app/router/app_router.dart';
import 'package:gts_learn/presentation/feature/home/cubit/home_cubit.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/widget/app_loading.dart';

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
}
