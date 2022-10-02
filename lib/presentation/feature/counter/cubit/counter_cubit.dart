import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:gts_learn/app/isolate/isolate_manager.dart';
import 'package:injectable/injectable.dart';

@injectable
class CounterCubit extends Cubit<int> {
  CounterCubit(this._isolateManager) : super(0);

  final IsolateManager _isolateManager;

  Future<void> init() async =>
      _isolateManager.initIsolate(() => log('example callback'));

  Future<void> increment() async {
    emit(state + 1);
  }

  void decrement() => emit(state - 1);
}
