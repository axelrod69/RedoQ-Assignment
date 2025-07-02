import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redoq_assignment/features/homeScreen/domain/model/assigneeModel.dart';

part 'assigneeState.freezed.dart';

@freezed
class AssigneeState with _$AssigneeState {
  factory AssigneeState({List<AssigneeModel>? assigneeModel}) = _AssigneeState;

  factory AssigneeState.initial() => AssigneeState(assigneeModel: []);
}