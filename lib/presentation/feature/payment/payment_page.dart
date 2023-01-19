import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gts_learn/presentation/feature/payment/cubit/payment_cubit.dart';
import 'package:gts_learn/presentation/widget/app_loading.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

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
        success: (List<Package> packages) => _PaymentPageBody(
          packages: packages,
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
  });

  final List<Package> packages;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
