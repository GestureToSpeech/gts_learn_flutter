import 'dart:io' show Platform;

import 'package:flutter/services.dart';
import 'package:gts_learn/data/manager/payment_manager.dart';
import 'package:gts_learn/data/model/offering_dto.dart';
import 'package:gts_learn/data/model/package_dto.dart';
import 'package:gts_learn/data/model/product_dto.dart';
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
      // TODO: ios key
      configuration = PurchasesConfiguration("public_ios_sdk_key");
    }
    await Purchases.configure(
      configuration..appUserID = 'mock_user_id',
    );
  }

  @override
  Future<List<OfferingDTO>> fetchOfferings() async {
    try {
      final offerings = await Purchases.getOfferings();
      final current = offerings.current;

      return current != null ? [current.toOfferingDTO()] : [];
    } on PlatformException catch (e) {
      // TODO: error handling
      return [];
    }
  }

  @override
  Future<void> purchasePackage(PackageDTO package) {
    // TODO: implement purchasePackage
    throw UnimplementedError();
  }

  @override
  Future<void> purchaseProduct(ProductDTO product) {
    // TODO: implement purchaseProduct
    throw UnimplementedError();
  }
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
