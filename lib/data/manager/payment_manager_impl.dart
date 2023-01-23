import 'dart:io' show Platform;

import 'package:flutter/services.dart';
import 'package:gts_learn/data/manager/payment_manager.dart';
import 'package:gts_learn/data/model/model.dart';
import 'package:injectable/injectable.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

@Singleton(as: PaymentManager)
class PaymentManagerImpl extends PaymentManager {
  @override
  Future<void> init() async {
    await Purchases.setDebugLogsEnabled(true);

    late PurchasesConfiguration configuration;
    if (Platform.isAndroid) {
      configuration = PurchasesConfiguration(
        'goog_oPKgxQJPQLNZBOGjojGNHzOIjar',
      );
    } else if (Platform.isIOS) {
      configuration = PurchasesConfiguration(
        'appl_PvgVDBmfgmiBYtKrddeGUYoOfwE',
      );
    }
    await Purchases.configure(
      configuration..appUserID = 'mock_user_id',
    );
  }

  @override
  Future<List<OfferingDTO>> fetchOfferings() async {
    try {
      return _mockOfferings;
      // final offerings = await Purchases.getOfferings();
      // final current = offerings.current;
      //
      // return current != null ? [current.toOfferingDTO()] : [];
    } on PlatformException catch (e) {
      // TODO: error handling
      rethrow;
    }
  }

  @override
  Future<CustomerInfoDTO> purchasePackage(PackageDTO package) async {
    try {
      final customerInfo = await Purchases.purchasePackage(
        package.toRcPackage(),
      );

      return customerInfo.toCustomerInfoDTO();
    } on PlatformException catch (e) {
      // TODO: error handling
      rethrow;
    }
  }

  @override
  Future<CustomerInfoDTO> purchaseProduct(ProductDTO product) async {
    try {
      // final customerInfo = await Purchases.purchaseProduct(product.id);
      //
      // return customerInfo.toCustomerInfoDTO();
      return CustomerInfoDTO(
        entitlements: [
          EntitlementInfoDTO(
            id: 'id1',
            isActive: true,
          ),
        ],
      );
    } on PlatformException catch (e) {
      // TODO: error handling
      rethrow;
    }
  }
}

/// extensions for mapping DTO's to RevenueCat models

// TODO: move extensions to separate file / directory

extension on CustomerInfo {
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

// ==== mocks ====

const _mockProducts = [
  ProductDTO(
    id: 'id1',
    title: '1 month',
    description: 'Subscription for 1 month',
    price: 20,
    currencyCode: 'PLN',
  ),
  ProductDTO(
    id: 'id2',
    title: '6 months',
    description: 'Subscription for 6 months',
    price: 90,
    currencyCode: 'PLN',
  ),
  ProductDTO(
    id: 'id3',
    title: '12 months',
    description: 'Subscription for 12 months',
    price: 120,
    currencyCode: 'PLN',
  ),
];

final _mockPackages = [
  PackageDTO(
    id: 'pid1',
    offeringId: '',
    product: _mockProducts[0],
  ),
  PackageDTO(
    id: 'pid2',
    offeringId: '',
    product: _mockProducts[1],
  ),
  PackageDTO(
    id: 'pid3',
    offeringId: '',
    product: _mockProducts[2],
  ),
];

final _mockOfferings = [
  OfferingDTO(
    id: 'odif1',
    packages: _mockPackages,
  ),
];
