import 'package:flutter/material.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/style/app_assets.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/style/app_icons.dart';

class GTSAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GTSAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(AppDimens.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppDimens.d20),
      child: AppBar(
        toolbarHeight: AppDimens.appBarHeight,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Image(
          image: AssetImage(AppAssets.logo),
        ),
        actions: [
          const Icon(AppIcons.help),
          AppSpacers.w20,
          const Icon(AppIcons.message),
          AppSpacers.w20,
          SizedBox(
            width: AppDimens.appBarMenuWidth,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const Icon(AppIcons.menu),
                Positioned.fill(
                  top: AppDimens.appBarMenuTextOffset,
                  child: Text(
                    context.str.app_bar__menu,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
