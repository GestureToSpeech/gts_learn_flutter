import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/app/get_it/get_it_init.dart';
import 'package:gts_learn/presentation/feature/dictionary/cubit/dictionary_cubit.dart';

class DictionaryWrapperPage extends StatelessWidget {
  const DictionaryWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DictionaryCubit>()..init(),
      lazy: false,
      child: const AutoRouter(),
    );
  }
}
