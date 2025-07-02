import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redoq_assignment/core/providers/dependencyInjection.dart';
import 'package:redoq_assignment/core/utils/appLog.dart';
import 'package:redoq_assignment/features/homeScreen/domain/model/assigneeModel.dart';
import 'package:redoq_assignment/features/homeScreen/domain/useCase/assigneeUseCase.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/states/assigneeState.dart';

class AssigneeProvider extends StateNotifier<AssigneeState> {
  final AssigneeUseCase assigneeUseCase;

  AssigneeProvider(this.assigneeUseCase) : super(AssigneeState.initial()) {
    assigneeList();
  }

  void assigneeList() {
    state = state.copyWith(assigneeModel: assigneeUseCase.getList());

    AppLog.showLog(tag: 'Assignee List', object: state.assigneeModel);
  }
}

final assigneeProvider =
    StateNotifierProvider<AssigneeProvider, AssigneeState>(
        (ref) => AssigneeProvider(ref.read(assigneeUseCaseProvider)));

final selectedAssigneeProvider = StateProvider<AssigneeModel?>((ref) => null);        
