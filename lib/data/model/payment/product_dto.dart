import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_dto.freezed.dart';

@freezed
class ProductDTO with _$ProductDTO {
  const factory ProductDTO({
    required String id,
    required String title,
    required String description,
    required double price,
    required String currencyCode,
  }) = _ProductDTO;
}
