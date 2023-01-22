import 'package:freezed_annotation/freezed_annotation.dart';

part 'entitlement_info_entity.freezed.dart';

@freezed
class EntitlementInfoEntity with _$EntitlementInfoEntity {
  const factory EntitlementInfoEntity({
    required String id,
    required bool isActive,
  }) = _EntitlementInfoEntity;
}
