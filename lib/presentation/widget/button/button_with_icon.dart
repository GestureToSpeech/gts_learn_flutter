import 'package:flutter/material.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({
    super.key,
    required this.text,
    this.onPressed,
    required this.icon,
  });

  final String text;
  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.d32),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: AppDimens.buttonIconSize,
            ),
            const Spacer(),
            Center(child: Text(text)),
            const Spacer(),
            const SizedBox(width: AppDimens.buttonIconSize),
          ],
        ),
      ),
    );
  }
}
