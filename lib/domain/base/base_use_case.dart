import 'package:fpdart/fpdart.dart';

abstract class BaseUseCase<T, S> {
  const BaseUseCase();
  Future<T> call(S param);
}
