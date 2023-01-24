import 'package:gts_learn/domain/base/base_use_case.dart';
import 'package:gts_learn/domain/model/payment/offering_entity.dart';
import 'package:gts_learn/domain/repository/subscription_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchOfferingsUseCase extends BaseUseCase<List<OfferingEntity>, void> {
  FetchOfferingsUseCase(this._repository);

  final SubscriptionRepository _repository;

  @override
  Future<List<OfferingEntity>> call(_) => _repository.fetchOfferings();
}
