import 'package:gts_learn/domain/model/payment/payment.dart';

abstract class SubscriptionRepository {
  Future<List<OfferingEntity>> fetchOfferings();

  Future<CustomerInfoEntity> purchaseProduct(ProductEntity product);

  Future<CustomerInfoEntity> purchasePackage(PackageEntity package);
}
