import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/app/get_it/get_it_init.dart';
import 'package:gts_learn/presentation/feature/home/cubit/home_cubit.dart';
import 'package:gts_learn/presentation/widget/app_loading.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<HomeCubit>(
        create: (_) => getIt<HomeCubit>()..init(),
        child: const _HomePageCore(),
      ),
    );
  }
}

class _HomePageCore extends StatelessWidget {
  const _HomePageCore();

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
    return Container();
  }
}
