import 'package:flutter/material.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/theme/app_text_theme.dart';

class GTSBackButton extends StatelessWidget {
  const GTSBackButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          const Icon(Icons.keyboard_arrow_left_rounded),
          Text(
            text,
            style: appTextTheme().bodyText1,
          ),
        ],
      ),
    );
  }
}