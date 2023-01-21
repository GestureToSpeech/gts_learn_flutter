import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/domain/model/package_entity.dart';
import 'package:gts_learn/domain/model/product_entity.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/feature/payment/cubit/payment_cubit.dart';
import 'package:gts_learn/presentation/feature/payment/widget/subscription_tile.dart';
import 'package:gts_learn/presentation/style/app_assets.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/style/app_text_styles.dart';
import 'package:gts_learn/presentation/widget/app_loading.dart';
import 'package:gts_learn/presentation/widget/button/button_with_icon.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) => state.maybeWhen(
        failure: () => _onFailure(context),
        orElse: () => null,
      ),
      builder: (context, state) => state.maybeWhen(
        loading: () => const AppLoading(),
        success: (
          List<PackageEntity> packages,
          ProductEntity selectedProduct,
        ) =>
            _PaymentPageBody(
          packages: packages,
          selectedProduct: selectedProduct,
        ),
        orElse: () => const SizedBox(),
      ),
    );
  }

  void _onFailure(BuildContext context) {}
}

class _PaymentPageBody extends StatelessWidget {
  const _PaymentPageBody({
    required this.packages,
    required this.selectedProduct,
  });

  final List<PackageEntity> packages;
  final ProductEntity selectedProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.paymentPageHorizontalPadding,
            vertical: AppDimens.paymentPageVerticalPadding,
          ),
          child: Column(
            children: [
              Image.asset(AppAssets.logo),
              AppSpacers.h40,
              Text(
                context.str.payment__choose_your_plan,
                style: AppTextStyles.bold20,
              ),
              AppSpacers.h32,
              _SubscriptionList(
                packages: packages,
                selectedProduct: selectedProduct,
              ),
              const Spacer(),
              const _ChooseSubscriptionButton(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SubscriptionList extends StatelessWidget {
  const _SubscriptionList({
    required this.packages,
    required this.selectedProduct,
  });

  final List<PackageEntity> packages;
  final ProductEntity selectedProduct;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      child: ListView.separated(
        separatorBuilder: (_, __) => AppSpacers.h16,
        itemCount: packages.length,
        itemBuilder: (context, index) => SubscriptionTile(
          selected: packages[index].product == selectedProduct,
          product: packages[index].product,
          onTap: () => context.read<PaymentCubit>().selectProduct(
                product: packages[index].product,
              ),
        ),
      ),
    );
  }
}

class _ChooseSubscriptionButton extends StatelessWidget {
  const _ChooseSubscriptionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonWithIcon(
      onPressed: () => context.read<PaymentCubit>().purchaseProduct(),
      text: context.str.payment__purchase,
      icon: Icons.payment,
    );
  }
}
