import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gts_learn/presentation/feature/counter/counter.dart';

part 'app_router.gr.dart';

// Documentation -> https://pub.dev/packages/auto_route

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: CounterPage, initial: true),
  ],
)
class AppRouter extends _$AppRouter {}
