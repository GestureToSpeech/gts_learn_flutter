import 'package:gts_learn/data/manager/payment_manager.dart';
import 'package:gts_learn/data/model/offering_dto.dart';
import 'package:gts_learn/data/model/package_dto.dart';
import 'package:gts_learn/data/model/product_dto.dart';
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
  Future<void> purchasePackage(PackageDTO package) async {
    await _paymentManager.purchasePackage(package);
  }

  @override
  Future<void> purchaseProduct(ProductDTO product) async {
    await _paymentManager.purchaseProduct(product);
  }
}
