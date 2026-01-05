
import 'package:freezed_annotation/freezed_annotation.dart';

part 'load_data_state.freezed.dart';

@freezed
class LoadDataState<T> with _$LoadDataState<T> {
  const factory LoadDataState.initial() = _Initial;
  const factory LoadDataState.loading() = _Loading;
  const factory LoadDataState.success({required T? data}) = _Success;
  const factory LoadDataState.error({required String? error}) = _Error;
}