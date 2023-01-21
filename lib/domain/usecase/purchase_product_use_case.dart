import 'package:gts_learn/domain/base/base_use_case.dart';
import 'package:gts_learn/domain/model/product_entity.dart';
import 'package:gts_learn/domain/repository/subscription_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class PurchaseProductUseCase extends BaseUseCase<void, ProductEntity> {
  PurchaseProductUseCase(this._repository);

  final SubscriptionRepository _repository;

  @override
  Future<void> call(ProductEntity param) => _repository.purchaseProduct(param);
}
