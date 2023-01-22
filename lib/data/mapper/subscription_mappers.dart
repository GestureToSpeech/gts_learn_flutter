import 'package:gts_learn/data/model/model.dart';
import 'package:gts_learn/domain/model/payment/payment.dart';

extension OfferingDTOMapper on OfferingDTO {
  OfferingEntity toOfferingEntity() => OfferingEntity(
        id: id,
        packages: packages
            .map(
              (p) => p.toPackageEntity(),
            )
            .toList(),
      );
}

extension OfferingEntityMapper on OfferingEntity {
  OfferingDTO toOfferingDTO() => OfferingDTO(
        id: id,
        packages: packages
            .map(
              (e) => e.toPackageDTO(),
            )
            .toList(),
      );
}

extension PackageDTOMapper on PackageDTO {
  PackageEntity toPackageEntity() => PackageEntity(
        id: id,
        offeringId: offeringId,
        product: product.toProductEntity(),
      );
}

extension PackageEntityMapper on PackageEntity {
  PackageDTO toPackageDTO() => PackageDTO(
        id: id,
        offeringId: offeringId,
        product: product.toProductDTO(),
      );
}

extension ProductDTOMapper on ProductDTO {
  ProductEntity toProductEntity() => ProductEntity(
        id: id,
        title: title,
        description: description,
        price: price,
        currencyCode: currencyCode,
      );
}

extension ProductEntityMapper on ProductEntity {
  ProductDTO toProductDTO() => ProductDTO(
        id: id,
        title: title,
        description: description,
        price: price,
        currencyCode: currencyCode,
      );
}

extension EntitlementInfoDTOMapper on EntitlementInfoDTO {
  EntitlementInfoEntity toEntitlementInfoEntity() => EntitlementInfoEntity(
        id: id,
        isActive: isActive,
      );
}

extension CustomerInfoDTOMapper on CustomerInfoDTO {
  CustomerInfoEntity toCustomerInfoEntity() => CustomerInfoEntity(
        entitlements: entitlements
            .map(
              (e) => e.toEntitlementInfoEntity(),
            )
            .toList(),
      );
}
