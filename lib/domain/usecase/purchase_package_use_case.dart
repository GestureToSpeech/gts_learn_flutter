import 'package:gts_learn/domain/base/base_use_case.dart';
import 'package:gts_learn/domain/model/payment/payment.dart';
import 'package:gts_learn/domain/repository/subscription_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class PurchasePackageUseCase
    extends BaseUseCase<CustomerInfoEntity, PackageEntity> {
  PurchasePackageUseCase(this._repository);

  final SubscriptionRepository _repository;

  @override
  Future<CustomerInfoEntity> call(PackageEntity param) =>
      _repository.purchasePackage(
        param,
      );
}
