import 'package:gts_learn/domain/base/base_use_case.dart';
import 'package:gts_learn/domain/repository/subscription_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:purchases_flutter/models/offering_wrapper.dart';

@injectable
class FetchOfferingsUseCase extends BaseUseCase<List<Offering>, void> {
  FetchOfferingsUseCase(this._repository);

  final SubscriptionRepository _repository;

  // TODO: refactor, call argument
  @override
  Future<List<Offering>> call(_) => _repository.fetchOfferings();
}
