import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/l10n/l10n.dart';
import 'package:gts_learn/presentation/feature/payment/cubit/payment_cubit.dart';
import 'package:gts_learn/presentation/widget/button/button_with_icon.dart';

class PurchaseButton extends StatelessWidget {
  const PurchaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonWithIcon(
      onPressed: () => context.read<PaymentCubit>().purchaseProduct(),
      text: context.str.payment__purchase,
      icon: Icons.payment,
    );
  }
}
