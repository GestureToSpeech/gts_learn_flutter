import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/domain/model/payment/product_entity.dart';

part 'package_entity.freezed.dart';

@freezed
class PackageEntity with _$PackageEntity {
  const factory PackageEntity({
    required String id,
    required String offeringId,
    required ProductEntity product,
  }) = _PackageEntity;
}
