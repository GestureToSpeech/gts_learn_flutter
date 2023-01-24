import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/app/base/base_cubit.dart';
import 'package:gts_learn/domain/model/payment/payment.dart';
import 'package:gts_learn/domain/usecase/fetch_offerings_use_case.dart';
import 'package:gts_learn/domain/usecase/purchase_product_use_case.dart';
import 'package:injectable/injectable.dart';

part 'payment_cubit.freezed.dart';
part 'payment_state.dart';

@injectable
class PaymentCubit extends BaseCubit<PaymentState> {
  PaymentCubit(
    this._fetchOfferingsUseCase,
    this._purchaseProductUseCase,
  ) : super(
          const PaymentState.initial(),
        );

  final FetchOfferingsUseCase _fetchOfferingsUseCase;
  final PurchaseProductUseCase _purchaseProductUseCase;

  @override
  Future<void> init() async {
    emit(const PaymentState.loading());
    final offerings = await _fetchOfferingsUseCase('');
    if (offerings.isNotEmpty && offerings[0].packages.isNotEmpty) {
      emit(
        PaymentState.success(
          availablePackages: offerings[0].packages,
          selectedProduct: offerings[0].packages[0].product,
          status: PaymentStatus.unfinished,
          paymentError: false,
        ),
      );
    } else {
      emit(
        const PaymentState.failure(),
      );
    }
  }

  void selectProduct({
    required ProductEntity product,
  }) {
    state.mapOrNull(
      success: (state) => emit(
        state.copyWith(
          selectedProduct: product,
        ),
      ),
    );
  }

  Future<void> purchaseProduct() async {
    await state.mapOrNull(
      success: (state) async {
        final customerInfo = await _purchaseProductUseCase(
          state.selectedProduct,
        );
        emit(
          customerInfo.entitlements.isNotEmpty
              ? state.copyWith(status: PaymentStatus.finished)
              : state.copyWith(
                  paymentError: true,
                ),
        );
      },
    );
  }

  /// after unsuccessful purchase reset error message
  void resetErrorMessage() {
    state.mapOrNull(
      success: (state) => emit(
        state.copyWith(
          paymentError: false,
        ),
      ),
    );
  }
}
