import 'package:gts_learn/data/model/model.dart';

abstract class SubscriptionService {
  Future<List<OfferingDTO>> fetchOfferings();

  Future<CustomerInfoDTO> purchaseProduct(ProductDTO product);

  Future<CustomerInfoDTO> purchasePackage(PackageDTO package);
}
