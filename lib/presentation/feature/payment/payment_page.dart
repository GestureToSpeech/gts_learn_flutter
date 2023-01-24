import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/domain/model/payment/payment.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/feature/payment/cubit/payment_cubit.dart';
import 'package:gts_learn/presentation/feature/payment/widget/purchase_button.dart';
import 'package:gts_learn/presentation/feature/payment/widget/subscription_tile.dart';
import 'package:gts_learn/presentation/style/app_assets.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/style/app_text_styles.dart';
import 'package:gts_learn/presentation/widget/app_loading.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) => state.maybeWhen(
        success: (_, __, paymentStatus, paymentError) {
          if (paymentError) {
            _onPaymentFailure(context);
          } else if (paymentStatus == PaymentStatus.finished) {
            _onPaymentSuccess(context);
          }
        },
        orElse: () => null,
      ),
      builder: (context, state) => state.maybeWhen(
        loading: () => const AppLoading(),
        success: (
          List<PackageEntity> packages,
          ProductEntity selectedProduct,
          _,
          __,
        ) =>
            _PaymentPageBody(
          packages: packages,
          selectedProduct: selectedProduct,
        ),
        orElse: () => const SizedBox(),
      ),
    );
  }

  void _onPaymentFailure(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text(
          context.str.payment__payment_failed,
        ),
        actions: [
          TextButton(
            onPressed: () {
              // pop dialog
              context.router.pop();
              context.read<PaymentCubit>().resetErrorMessage();
            },
            child: Text(
              context.str.general__ok,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onPaymentSuccess(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          context.str.payment__payment_was_successful,
        ),
        actions: [
          TextButton(
            onPressed: () {
              // pop dialog
              context.router.pop();
            },
            child: Text(
              context.str.payment__continue,
            ),
          ),
        ],
      ),
    );
    // pop payment page
    await context.router.pop();
  }
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
              const PurchaseButton(),
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
