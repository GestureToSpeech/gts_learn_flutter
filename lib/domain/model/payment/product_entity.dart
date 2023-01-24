import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.freezed.dart';

@freezed
class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required String id,
    required String title,
    required String description,
    required double price,
    required String currencyCode,
  }) = _ProductEntity;
}
