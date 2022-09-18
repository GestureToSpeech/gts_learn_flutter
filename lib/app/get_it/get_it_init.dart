import 'package:get_it/get_it.dart';
import 'package:gts_learn/app/get_it/get_it_init.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  asExtension: false,
)
void configureDependencies() => $initGetIt(getIt);
