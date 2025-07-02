import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redoq_assignment/features/homeScreen/domain/model/taskModel.dart';

part 'taskState.freezed.dart';

@freezed
class TaskState with _$TaskState {
  factory TaskState({
    List<TaskModel>? allList,
    List<TaskModel>? taskList,
    List<TaskModel>? inProgressList,
    List<TaskModel>? completedList,
  }) = _TaskState;

  factory TaskState.initial() => TaskState(
      allList: [], taskList: [], inProgressList: [], completedList: []);
}
