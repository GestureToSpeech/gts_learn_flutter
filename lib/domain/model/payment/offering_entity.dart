import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/domain/model/payment/package_entity.dart';

part 'offering_entity.freezed.dart';

@freezed
class OfferingEntity with _$OfferingEntity {
  const factory OfferingEntity({
    required String id,
    required List<PackageEntity> packages,
  }) = _OfferingEntity;
}
