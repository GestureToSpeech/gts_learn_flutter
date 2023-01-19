import 'package:purchases_flutter/models/offering_wrapper.dart';

abstract class SubscriptionRepository {
  Future<List<Offering>> fetchOfferings();
}
