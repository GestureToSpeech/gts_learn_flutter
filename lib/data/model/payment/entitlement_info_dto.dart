import 'package:freezed_annotation/freezed_annotation.dart';

part 'entitlement_info_dto.freezed.dart';

@freezed
class EntitlementInfoDTO with _$EntitlementInfoDTO {
  const factory EntitlementInfoDTO({
    required String id,
    required bool isActive,
  }) = _EntitlementInfoDTO;
}
