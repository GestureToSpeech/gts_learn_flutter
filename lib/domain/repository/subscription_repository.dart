import 'package:gts_learn/domain/model/offering_entity.dart';
import 'package:gts_learn/domain/model/package_entity.dart';
import 'package:gts_learn/domain/model/product_entity.dart';

abstract class SubscriptionRepository {
  Future<List<OfferingEntity>> fetchOfferings();

  Future<void> purchaseProduct(ProductEntity product);

  Future<void> purchasePackage(PackageEntity package);
}
