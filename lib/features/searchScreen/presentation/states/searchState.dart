import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redoq_assignment/features/homeScreen/domain/model/taskModel.dart';

part 'searchState.freezed.dart';

@freezed
class SearchState with _$SearchState {
  factory SearchState({
    @Default('') String query,
    @Default([]) List<TaskModel> results
  }) = _SearchState;

  factory SearchState.initial() => SearchState();
}