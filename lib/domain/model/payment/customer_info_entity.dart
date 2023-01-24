import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/domain/model/payment/payment.dart';

part 'customer_info_entity.freezed.dart';

@freezed
class CustomerInfoEntity with _$CustomerInfoEntity {
  const factory CustomerInfoEntity({
    required List<EntitlementInfoEntity> entitlements,
  }) = _CustomerInfoEntity;
}
