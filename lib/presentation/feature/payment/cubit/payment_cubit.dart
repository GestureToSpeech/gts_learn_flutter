import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/app/base/base_cubit.dart';
import 'package:gts_learn/domain/usecase/fetch_offerings_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:purchases_flutter/models/package_wrapper.dart';

part 'payment_cubit.freezed.dart';
part 'payment_state.dart';

@injectable
class PaymentCubit extends BaseCubit<PaymentState> {
  PaymentCubit(
    this._fetchOfferingsUseCase,
  ) : super(
          const PaymentState.initial(),
        );

  final FetchOfferingsUseCase _fetchOfferingsUseCase;

  @override
  Future<void> init() async {
    emit(const PaymentState.loading());
    final offerings = await _fetchOfferingsUseCase('');
    if (offerings.isNotEmpty) {
      emit(
        PaymentState.success(
          availablePackages: offerings[0].availablePackages,
        ),
      );
    } else {
      emit(
        const PaymentState.failure(),
      );
    }
  }
}
