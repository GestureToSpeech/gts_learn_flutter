import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gts_learn/app/base/base_cubit.dart';
import 'package:injectable/injectable.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  @override
  Future<void> init() async {
    emit(const HomeState.success());
  }
}
