import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gts_learn/presentation/feature/core/core_page.dart';
import 'package:gts_learn/presentation/feature/dictionary/dictionary_page.dart';
import 'package:gts_learn/presentation/feature/dictionary/wrapper/dictionary_wrapper_page.dart';
import 'package:gts_learn/presentation/feature/home/home_page.dart';
import 'package:gts_learn/presentation/feature/home/wrapper/home_wrapper_page.dart';
import 'package:gts_learn/presentation/feature/lessons/lessons_page.dart';
import 'package:gts_learn/presentation/feature/lessons/wrapper/lessons_wrapper_page.dart';
import 'package:gts_learn/presentation/feature/quiz/model/quiz_question.dart';
import 'package:gts_learn/presentation/feature/quiz/wrapper/quiz_wrapper_page.dart';

part 'app_router.gr.dart';

// Documentation -> https://pub.dev/packages/auto_route

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: CorePage,
      children: [
        AutoRoute(
          path: 'lessons',
          name: 'HomeRouter',
          page: HomeWrapperPage,
          children: [
            AutoRoute(path: '', page: HomePage),
          ],
        ),
        AutoRoute(
          path: 'lessons',
          name: 'LessonsRouter',
          page: LessonsWrapperPage,
          children: [
            AutoRoute(path: '', page: LessonsPage),
            AutoRoute(path: 'quiz', name: 'QuizPage', page: QuizWrapperPage),
          ],
        ),
        AutoRoute(
          path: 'dictionary',
          name: 'DictionaryRouter',
          page: DictionaryWrapperPage,
          children: [
            AutoRoute(path: '', page: DictionaryPage),
          ],
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
