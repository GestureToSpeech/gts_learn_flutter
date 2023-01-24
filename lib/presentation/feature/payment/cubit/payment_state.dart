part of 'payment_cubit.dart';

enum PaymentStatus {
  unfinished,
  finished,
}

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState.initial() = _Initial;
  const factory PaymentState.loading() = _Loading;
  const factory PaymentState.success({
    required List<PackageEntity> availablePackages,
    required ProductEntity selectedProduct,
    required PaymentStatus status,
    required bool paymentError,
  }) = _Success;
  const factory PaymentState.failure() = _LoadFailure;
}
