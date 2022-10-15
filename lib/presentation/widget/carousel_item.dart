import 'package:flutter/material.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';

//@TODO: EVERYTHING HERE IS PRETTY MUCH TODO, NEED TO REFACTOR AFTER NEW DESIGNS

class CarouselItem extends StatelessWidget {
  const CarouselItem({
    super.key,
    required this.itemIndex,
    required this.itemUrl,
    required this.label,
    required this.itemsCount,
  });

  final int itemIndex;
  final int itemsCount;
  final String itemUrl;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: AppDimens.d24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Padding(
              padding: const EdgeInsets.only(
                right: AppDimens.d16,
                bottom: AppDimens.d8,
              ),
              child: Text(
                '${itemIndex + 1}/$itemsCount',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadiusDirectional.all(
              Radius.circular(AppDimens.carouselBorderRadius),
            ),
            child: Image.network(itemUrl, fit: BoxFit.cover, width: 1000),
          ),
          AppSpacers.h20,
          Text(
            label,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          AppSpacers.h8,
          const Text(
            'qweqw sdfsdf wewefwef sdvsdf ewfwefwe qweqwdawd qwrqwqwd scscs.',
          ),
          AppSpacers.h12,
          const _BottomArrow(),
        ],
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
            color: Colors.black,
          ),
        ),
        AppSpacers.w4,
        Text(
          context.str.main__more,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const Icon(Icons.arrow_forward_ios)
      ],
    );
  }
}
