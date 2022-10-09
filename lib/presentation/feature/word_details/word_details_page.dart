import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/app/get_it/get_it_init.dart';
import 'package:gts_learn/presentation/feature/word_details/cubit/word_details_cubit.dart';
import 'package:gts_learn/presentation/widget/app_loading.dart';

class WordDetailsPage extends StatelessWidget {
  const WordDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<WordDetailsCubit>(
        create: (_) => getIt<WordDetailsCubit>()..init(),
        child: const _WordDetailsPageCore(),
      ),
    );
  }
}

class _WordDetailsPageCore extends StatelessWidget {
  const _WordDetailsPageCore();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WordDetailsCubit, WordDetailsState>(
      listener: (context, state) => state.maybeWhen(
        failure: () => _onFailure(context),
        orElse: () => null,
      ),
      builder: (context, state) => state.maybeWhen(
        loading: () => const AppLoading(),
        success: () => const _WordDetailsPageBody(),
        orElse: () => const SizedBox(),
      ),
    );
  }

  void _onFailure(BuildContext context) {}
}

class _WordDetailsPageBody extends StatelessWidget {
  const _WordDetailsPageBody();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
