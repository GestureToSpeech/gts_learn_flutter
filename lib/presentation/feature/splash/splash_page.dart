import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gts_learn/app/get_it/get_it_init.dart';
import 'package:gts_learn/app/router/app_router.dart';
import 'package:gts_learn/presentation/feature/splash/cubit/splash_cubit.dart';

class SplashPage extends StatelessWidget implements AutoRouteWrapper {
  const SplashPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SplashCubit>()..init(context),
      lazy: false,
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) => state.whenOrNull(
        initialized: () => _onInitialized(context),
      ),
      builder: (context, state) => state.maybeWhen(
        initializing: () => const SizedBox(),
        orElse: () => const SizedBox(),
      ),
    );
  }

  void _onInitialized(BuildContext context) {
    FlutterNativeSplash.remove();
    context.router.replace(const CoreRoute());
  }
}
