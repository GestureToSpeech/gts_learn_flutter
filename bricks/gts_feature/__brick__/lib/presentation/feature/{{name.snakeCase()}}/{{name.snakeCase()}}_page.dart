import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/app/get_it/get_it_init.dart';
import 'package:gts_learn/presentation/feature/home/cubit/{{name.snakeCase()}}_cubit.dart';
import 'package:gts_learn/presentation/widget/app_loading.dart';

class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<{{name.pascalCase()}}Cubit>(
        create: (_) => getIt<{{name.pascalCase()}}Cubit>()..init(),
        child: const _{{name.pascalCase()}}PageCore(),
      ),
    );
  }
}

class _{{name.pascalCase()}}PageCore extends StatelessWidget {
  const _{{name.pascalCase()}}PageCore();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>(
      listener: (context, state) => state.maybeWhen(
        failure: () => _onFailure(context),
        orElse: () => null,
      ),
      builder: (context, state) => state.maybeWhen(
        loading: () => const AppLoading(),
        success: () => const _{{name.pascalCase()}}PageBody(),
        orElse: () => const SizedBox(),
      ),
    );
  }

  void _onFailure(BuildContext context) {}
}

class _{{name.pascalCase()}}PageBody extends StatelessWidget {
  const _{{name.pascalCase()}}PageBody();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
