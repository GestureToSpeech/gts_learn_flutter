import 'package:gts_learn/data/mapper/subscription_mappers.dart';
import 'package:gts_learn/data/service/subscription/subscription_service.dart';
import 'package:gts_learn/domain/model/payment/customer_info_entity.dart';
import 'package:gts_learn/domain/model/payment/offering_entity.dart';
import 'package:gts_learn/domain/repository/subscription_repository.dart';
import 'package:injectable/injectable.dart';

import 'package:gts_learn/domain/model/payment/payment.dart';

@Injectable(as: SubscriptionRepository)
class SubscriptionRepositoryImpl extends SubscriptionRepository {
  SubscriptionRepositoryImpl(this._service);

  final SubscriptionService _service;

  @override
  Future<List<OfferingEntity>> fetchOfferings() async {
    final offeringsDto = await _service.fetchOfferings();
    return offeringsDto
        .map((offeringDto) => offeringDto.toOfferingEntity())
        .toList();
  }

  @override
  Future<CustomerInfoEntity> purchasePackage(PackageEntity package) async {
    final customerInfo = await _service.purchasePackage(
      package.toPackageDTO(),
    );
    return customerInfo.toCustomerInfoEntity();
  }

  @override
  Future<CustomerInfoEntity> purchaseProduct(ProductEntity product) async {
    final customerInfo = await _service.purchaseProduct(
      product.toProductDTO(),
    );
    return customerInfo.toCustomerInfoEntity();
  }
}
