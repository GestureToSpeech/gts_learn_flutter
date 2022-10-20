import 'package:flutter/material.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/style/app_colors.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/theme/app_text_theme.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({
    super.key,
    required this.itemIndex,
    required this.assetPath,
    required this.label,
    required this.itemsCount,
    required this.description,
  });

  final int itemIndex;
  final int itemsCount;
  final String assetPath;
  final String label;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppDimens.d20),
      child: Container(
        margin: const EdgeInsets.only(right: AppDimens.d24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const Positioned.fill(
                  top: AppDimens.carouselBackgroundOffset,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadiusDirectional.all(
                        Radius.circular(AppDimens.carouselBorderRadius),
                      ),
                    ),
                  ),
                ),
                Image(
                  image: AssetImage(assetPath),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: AppDimens.d8,
                  top: AppDimens.carouselCounterOffset,
                  child: Text(
                    '${itemIndex + 1}/$itemsCount',
                    style: appTextTheme().subtitle2?.copyWith(
                          fontSize: AppDimens.carouselCounterTextSize,
                        ),
                  ),
                ),
              ],
            ),
            AppSpacers.h20,
            Text(
              label,
              style: appTextTheme().headline3,
            ),
            AppSpacers.h8,
            SizedBox(
              height: AppDimens.carouselDescriptionHeight,
              child: Text(
                description,
              ),
            ),
            AppSpacers.h12,
            const _BottomArrow(),
          ],
        ),
      ),
    );
  }
}

class _BottomArrow extends StatelessWidget {
  const _BottomArrow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: AppDimens.carouselArrowWidth,
          height: AppDimens.carouselArrowHeight,
          decoration: const BoxDecoration(
            color: AppColors.mainText,
            borderRadius: BorderRadiusDirectional.all(
              Radius.circular(AppDimens.carouselArrowBorderRadius),
            ),
          ),
        ),
        AppSpacers.w4,
        Padding(
          padding: const EdgeInsets.only(bottom: AppDimens.d2),
          child: Text(
            context.str.main__more,
            style: appTextTheme().subtitle1,
            textAlign: TextAlign.center,
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios_rounded,
        ),
      ],
    );
  }
}
