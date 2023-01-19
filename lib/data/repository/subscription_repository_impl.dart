import 'package:gts_learn/data/service/subscription/subscription_service.dart';
import 'package:gts_learn/domain/repository/subscription_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:purchases_flutter/models/offering_wrapper.dart';

@Injectable(as: SubscriptionRepository)
class SubscriptionRepositoryImpl extends SubscriptionRepository {
  SubscriptionRepositoryImpl(this._service);

  final SubscriptionService _service;

  @override
  Future<List<Offering>> fetchOfferings() {
    return _service.fetchOfferings();
  }
}
