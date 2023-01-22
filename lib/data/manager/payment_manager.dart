import 'package:gts_learn/data/model/payment/payment.dart';

abstract class PaymentManager {
  Future<void> init();

  Future<List<OfferingDTO>> fetchOfferings();

  Future<CustomerInfoDTO> purchaseProduct(ProductDTO product);

  Future<CustomerInfoDTO> purchasePackage(PackageDTO package);
}
