part of 'payment_cubit.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState.initial() = _Initial;
  const factory PaymentState.loading() = _Loading;
  const factory PaymentState.success({
    required List<Package> availablePackages,
    required StoreProduct selectedProduct,
  }) = _Success;
  const factory PaymentState.failure() = _Failure;
}
