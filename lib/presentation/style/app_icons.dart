import 'package:flutter/widgets.dart';

@immutable
class _AppIconsData extends IconData {
  const _AppIconsData(super.codePoint, this.name)
      : super(
          fontFamily: 'AppIcons',
        );

  final String name;
}

@immutable
class AppIcons {
  const AppIcons._();

  static const account = _AppIconsData(0xe900, 'account');
  static const dictionary = _AppIconsData(0xe901, 'dictionary');
  static const help = _AppIconsData(0xe902, 'help');
  static const home = _AppIconsData(0xe903, 'home');
  static const lessons = _AppIconsData(0xe904, 'lessons');
  static const menu = _AppIconsData(0xe905, 'menu');
  static const message = _AppIconsData(0xe906, 'message');
  static const cooking = _AppIconsData(0xe907, 'cooking');
  static const search = _AppIconsData(0xe908, 'search');
  static const play = _AppIconsData(0xe909, 'play');
  static const lock = _AppIconsData(0xe90a, 'lock');
  static const next = _AppIconsData(0xe90b, 'next');
  static const backArrow = _AppIconsData(0xe90c, 'backArrow');
  static const done = _AppIconsData(0xe90d, 'done');
  static const fail = _AppIconsData(0xe90e, 'fail');
  static const gesture = _AppIconsData(0xe90f, 'gesture');
  static const map = _AppIconsData(0xe910, 'map');
  static const computer = _AppIconsData(0xe911, 'computer');
  static const clock = _AppIconsData(0xe912, 'clock');

  static const all = <String, _AppIconsData>{
    'account': account,
    'dictionary': dictionary,
    'help': help,
    'home': home,
    'lessons': lessons,
    'menu': menu,
    'message': message,
    'cooking': cooking,
    'search': search,
    'play': play,
    'lock': lock,
    'next': next,
    'backArrow': backArrow,
    'done': done,
    'fail': fail,
    'gesture': gesture,
    'map': map,
    'computer': computer,
  };
}
