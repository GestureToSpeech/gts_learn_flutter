import 'package:flutter/services.dart';
import 'package:gts_learn/data/service/subscription/subscription_service.dart';
import 'package:injectable/injectable.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

@Injectable(as: SubscriptionService)
class SubscriptionServiceImpl extends SubscriptionService {
  @override
  Future<List<Offering>> fetchOfferings() async {
    try {
      final offerings = await Purchases.getOfferings();
      final current = offerings.current;

      return current == null ? [] : [current];
    } on PlatformException catch (e) {
      // TODO: error handling
      return [];
    }
  }
}
