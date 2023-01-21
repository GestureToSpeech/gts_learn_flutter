import 'package:gts_learn/data/mapper/subscription_mappers.dart';
import 'package:gts_learn/data/service/subscription/subscription_service.dart';
import 'package:gts_learn/domain/model/offering_entity.dart';
import 'package:gts_learn/domain/model/package_entity.dart';
import 'package:gts_learn/domain/model/product_entity.dart';
import 'package:gts_learn/domain/repository/subscription_repository.dart';
import 'package:injectable/injectable.dart';

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
  Future<void> purchasePackage(PackageEntity package) async {
    return _service.purchasePackage(package.toPackageDTO());
  }

  @override
  Future<void> purchaseProduct(ProductEntity product) async {
    return _service.purchaseProduct(product.toProductDTO());
  }
}
