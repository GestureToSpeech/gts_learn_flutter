import 'dart:io' show Platform;

import 'package:flutter/services.dart';
import 'package:gts_learn/data/manager/payment_manager.dart';
import 'package:gts_learn/data/model/model.dart';
import 'package:injectable/injectable.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

part 'revenue_cat_mappers.dart';

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
      //@TODO: uncomment code below after store integration
      // final offerings = await Purchases.getOfferings();
      // final current = offerings.current;
      //
      // return current != null ? [current.toOfferingDTO()] : [];
    } on PlatformException catch (e) {
      //@TODO: error handling
      rethrow;
    }
  }

  @override
  Future<CustomerInfoDTO> purchasePackage(PackageDTO package) async {
    try {
      return _mockCustomerInfo;
      //@TODO: uncomment code below after store integration
      // final customerInfo = await Purchases.purchasePackage(
      //   package.toRcPackage(),
      // );
      //
      // return customerInfo.toCustomerInfoDTO();
    } on PlatformException catch (e) {
      //@TODO: error handling
      rethrow;
    }
  }

  @override
  Future<CustomerInfoDTO> purchaseProduct(ProductDTO product) async {
    try {
      return _mockCustomerInfo;
      //@TODO: uncomment code below after store integration
      // final customerInfo = await Purchases.purchaseProduct(product.id);
      //
      // return customerInfo.toCustomerInfoDTO();
    } on PlatformException catch (e) {
      //@TODO: error handling
      rethrow;
    }
  }
}

// ==== mocks ====

const _mockCustomerInfo = CustomerInfoDTO(
  entitlements: [
    EntitlementInfoDTO(
      id: 'id1',
      isActive: true,
    ),
  ],
);

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
