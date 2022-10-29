import 'package:flutter/material.dart';
import 'package:gts_learn/presentation/style/app_colors.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/theme/app_text_theme.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({
    super.key,
    required this.text,
    this.onPressed,
    required this.icon,
    this.subText,
  });

  final String text;
  final String? subText;
  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.d32),
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: onPressed != null
              ? null
              : MaterialStateProperty.all(AppColors.mainText.withOpacity(0.4)),
          backgroundColor: onPressed != null
              ? null
              : MaterialStateProperty.all(AppColors.inputBorder),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: AppDimens.buttonIconSize,
            ),
            AppSpacers.w12,
            const Spacer(),
            Center(
              child: Column(
                children: [
                  Text(text),
                  if (subText != null)
                    Text(
                      subText!,
                      style: onPressed != null
                          ? appTextTheme().subtitle2
                          : appTextTheme().subtitle2?.copyWith(
                                color: AppColors.mainText.withOpacity(0.4),
                              ),
                    ),
                ],
              ),
            ),
            const Spacer(),
            const SizedBox(width: AppDimens.buttonIconSize),
          ],
        ),
      ),
    );
  }
}
