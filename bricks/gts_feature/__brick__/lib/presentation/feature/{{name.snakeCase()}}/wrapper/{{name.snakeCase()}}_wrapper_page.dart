import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/app/get_it/get_it_init.dart';
import 'package:gts_learn/presentation/feature/{{name.snakeCase()}}/cubit/{{name.snakeCase()}}_cubit.dart';


class {{name.pascalCase()}}WrapperPage extends StatelessWidget {
  const {{name.pascalCase()}}WrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (_) => getIt<{{name.pascalCase()}}Cubit>()..init(),
        lazy: false,
        child: const AutoRouter(),
      ),
    );
  }
}
