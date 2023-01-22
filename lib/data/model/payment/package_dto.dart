import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/data/model/model.dart';

part 'package_dto.freezed.dart';

@freezed
class PackageDTO with _$PackageDTO {
  const factory PackageDTO({
    required String id,
    required String offeringId,
    required ProductDTO product,
  }) = _PackageDTO;
}
