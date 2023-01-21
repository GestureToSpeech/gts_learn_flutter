import 'package:gts_learn/data/model/model.dart';

abstract class PaymentManager {
  Future<void> init();

  Future<List<OfferingDTO>> fetchOfferings();

  Future<void> purchaseProduct(ProductDTO product);

  Future<void> purchasePackage(PackageDTO package);
}
