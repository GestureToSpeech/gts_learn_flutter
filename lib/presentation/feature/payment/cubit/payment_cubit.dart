import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/app/base/base_cubit.dart';
import 'package:gts_learn/domain/usecase/fetch_offerings_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:purchases_flutter/models/package_wrapper.dart';
import 'package:purchases_flutter/models/store_product_wrapper.dart';

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
    emit(
      PaymentState.success(
        availablePackages: _mockPackages,
        selectedProduct: _mockPackages[0].storeProduct,
      ),
    );
    // emit(const PaymentState.loading());
    // final offerings = await _fetchOfferingsUseCase('');
    // if (offerings.isNotEmpty && offerings[0].availablePackages.isNotEmpty) {
    //   emit(
    //     PaymentState.success(
    //       availablePackages: offerings[0].availablePackages,
    //       selectedProduct: offerings[0].availablePackages[0].storeProduct,
    //     ),
    //   );
    // } else {
    //   emit(
    //     const PaymentState.failure(),
    //   );
    // }
  }

  void selectProduct({
    required StoreProduct product,
  }) {
    state.mapOrNull(
      success: (state) => emit(
        state.copyWith(
          selectedProduct: product,
        ),
      ),
    );
  }

  void purchaseProduct() {
    // TODO: purchase product
  }
}

final _mockPackages = [
  Package(
    'packageid1',
    PackageType.monthly,
    _mockProducts[0],
    'ofid1',
  ),
  Package(
    'packageid2',
    PackageType.sixMonth,
    _mockProducts[1],
    'ofid2',
  ),
  Package(
    'packageid3',
    PackageType.annual,
    _mockProducts[2],
    'ofid3',
  ),
];

const _mockProducts = [
  StoreProduct(
    'id1',
    'Subscription for 1 month',
    '1 month',
    20,
    '20 PLN',
    'PLN',
  ),
  StoreProduct(
    'id2',
    'Subscription for 6 months',
    '6 months',
    90,
    '90 PLN',
    'PLN',
  ),
  StoreProduct(
    'id3',
    'Subscription for 12 months',
    '12 months',
    120,
    '120 PLN',
    'PLN',
  ),
];
