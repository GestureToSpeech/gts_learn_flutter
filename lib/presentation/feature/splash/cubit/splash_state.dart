part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initializing() = _Loading;
  const factory SplashState.initialized() = _Initialized;
}
