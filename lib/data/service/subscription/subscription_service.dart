import 'package:purchases_flutter/models/offering_wrapper.dart';

abstract class SubscriptionService {
  Future<List<Offering>> fetchOfferings();
}
