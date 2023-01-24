import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/data/model/payment/entitlement_info_dto.dart';

part 'customer_info_dto.freezed.dart';

@freezed
class CustomerInfoDTO with _$CustomerInfoDTO {
  const factory CustomerInfoDTO({
    required List<EntitlementInfoDTO> entitlements,
  }) = _CustomerInfoDTO;
}
