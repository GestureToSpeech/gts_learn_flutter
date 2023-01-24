import 'package:gts_learn/data/manager/payment_manager.dart';
import 'package:gts_learn/data/model/model.dart';
import 'package:gts_learn/data/service/subscription/subscription_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubscriptionService)
class SubscriptionServiceImpl extends SubscriptionService {
  SubscriptionServiceImpl(
    this._paymentManager,
  );

  final PaymentManager _paymentManager;

  @override
  Future<List<OfferingDTO>> fetchOfferings() {
    return _paymentManager.fetchOfferings();
  }

  @override
  Future<CustomerInfoDTO> purchasePackage(PackageDTO package) async {
    return _paymentManager.purchasePackage(package);
  }

  @override
  Future<CustomerInfoDTO> purchaseProduct(ProductDTO product) async {
    return _paymentManager.purchaseProduct(product);
  }
}
