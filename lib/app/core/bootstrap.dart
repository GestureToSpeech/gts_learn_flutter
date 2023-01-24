import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gts_learn/app/get_it/get_it_init.dart';
import 'package:gts_learn/data/manager/payment_manager.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  Bloc.observer = AppBlocObserver();
  configureDependencies();
  await getIt<PaymentManager>().init();

  await runZonedGuarded(
    () async => runApp(await builder()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
