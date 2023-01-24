import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/data/model/payment/package_dto.dart';

part 'offering_dto.freezed.dart';

@freezed
class OfferingDTO with _$OfferingDTO {
  const factory OfferingDTO({
    required String id,
    required List<PackageDTO> packages,
  }) = _OfferingDTO;
}
