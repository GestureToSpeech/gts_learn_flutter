part of 'payment_manager_impl.dart';

/// extensions for mapping RevenueCat models to DTO's

extension Revenue on CustomerInfo {
  CustomerInfoDTO toCustomerInfoDTO() {
    return CustomerInfoDTO(
      entitlements: entitlements.all.values
          .map(
            (e) => e.toEntitlementInfoDTO(),
          )
          .toList(),
    );
  }
}

extension on EntitlementInfo {
  EntitlementInfoDTO toEntitlementInfoDTO() => EntitlementInfoDTO(
        id: identifier,
        isActive: isActive,
      );
}

extension on StoreProduct {
  ProductDTO toProductDTO() {
    return ProductDTO(
      id: identifier,
      title: title,
      description: description,
      price: price,
      currencyCode: currencyCode,
    );
  }
}

extension on Package {
  PackageDTO toPackageDTO() {
    return PackageDTO(
      id: identifier,
      offeringId: offeringIdentifier,
      product: storeProduct.toProductDTO(),
    );
  }
}

extension on Offering {
  OfferingDTO toOfferingDTO() {
    return OfferingDTO(
      id: identifier,
      packages: availablePackages
          .map(
            (e) => e.toPackageDTO(),
          )
          .toList(),
    );
  }
}

extension on PackageDTO {
  Package toRcPackage() {
    return Package(
      id,
      PackageType.custom,
      StoreProduct(
        product.id,
        product.description,
        product.title,
        product.price,
        '${product.price} ${product.currencyCode}',
        product.currencyCode,
      ),
      offeringId,
    );
  }
}
