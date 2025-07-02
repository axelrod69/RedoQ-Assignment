import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redoq_assignment/core/providers/dependencyInjection.dart';
import 'package:redoq_assignment/core/utils/appLog.dart';
import 'package:redoq_assignment/core/utils/helper.dart';
import 'package:redoq_assignment/core/widgets/snackBar.dart';
import 'package:redoq_assignment/features/homeScreen/domain/model/taskModel.dart';
import 'package:redoq_assignment/features/homeScreen/domain/useCase/taskDataUseCase.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/states/taskState.dart';

class TaskProvider extends StateNotifier<TaskState> {
  final TaskDataUseCase taskDataUseCase;

  TaskProvider(this.taskDataUseCase) : super(TaskState.initial()) {
    fetchTaskList();
    fetchInProgressList();
    fetchCompletedList();
  }

  Future<void> addToTaskList({required TaskModel? task}) async {
    final taskList = await taskDataUseCase.addToTaskList(task: task!);

    state = state.copyWith(taskList: taskList);

    showSuccessToast(message: 'Task Added');
  }

  Future<void> addToInProgressList({required TaskModel task}) async {
    final inProgressList = await taskDataUseCase.addToInProgress(task: task);

    state = state.copyWith(inProgressList: inProgressList);

    showSuccessToast(message: 'Task Added To In Progress List');
  }

  Future<void> addToDoneList({required TaskModel task}) async {
    final doneList = await taskDataUseCase.addToCompleted(task: task);

    state = state.copyWith(completedList: doneList);

    showSuccessToast(message: 'Task Added As Done');
  }
  
  Future<void> updateTask(
      {required TaskModel updatedTask, required String boxName}) async {
    final oldStatus = Helper.existingTaskStatus(updatedTask.taskId);

    final updatedList = await taskDataUseCase.updateTask(
      updatedTask: updatedTask,
      boxName: boxName,
    );

    if (boxName == 'To Do') {
      state = state.copyWith(taskList: updatedList);
    } else if (boxName == 'In Progress') {
      state = state.copyWith(inProgressList: updatedList);
    } else {
      state = state.copyWith(completedList: updatedList);
    }

    if (oldStatus != null && oldStatus != boxName) {
      if (oldStatus == 'To Do') {
        final updated = state.taskList!
            .where((task) => task.taskId != updatedTask.taskId)
            .toList();
        state = state.copyWith(taskList: updated);
      } else if (oldStatus == 'In Progress') {
        final updated = state.inProgressList!
            .where((task) => task.taskId != updatedTask.taskId)
            .toList();
        state = state.copyWith(inProgressList: updated);
      } else if (oldStatus == 'Done') {
        final updated = state.completedList!
            .where((task) => task.taskId != updatedTask.taskId)
            .toList();
        state = state.copyWith(completedList: updated);
      }
    }

    showSuccessToast(message: 'Task Updated');
  }

  Future<void> deleteTask(
      {required int taskId, required String boxName}) async {
    final updatedList =
        await taskDataUseCase.deleteTask(taskId: taskId, boxName: boxName);

    state = boxName == 'To Do'
        ? state.copyWith(taskList: updatedList)
        : boxName == 'In Progress'
            ? state.copyWith(inProgressList: updatedList)
            : state.copyWith(completedList: updatedList);

    showSuccessToast(message: 'Task Deleted');
  }

  void allTaskList() {
    final allTaskList = taskDataUseCase.getAllTasks();
    state = state.copyWith(allList: allTaskList);

    AppLog.showLog(tag: 'aLL List: ${state.allList}');
  }

  void fetchTaskList() {
    final taskList = taskDataUseCase.getTasks();
    state = state.copyWith(taskList: taskList);

    AppLog.showLog(tag: 'Task List: ${state.taskList}');
  }

  void fetchInProgressList() {
    final inProgressList = taskDataUseCase.getInProgressTasks();
    state = state.copyWith(inProgressList: inProgressList);

    AppLog.showLog(tag: 'In Progress List: ${state.inProgressList}');
  }

  void fetchCompletedList() {
    final completedList = taskDataUseCase.getDoneTasks();
    state = state.copyWith(completedList: completedList);

    AppLog.showLog(tag: 'Completed List: ${state.completedList}');
  }
}

final taskProvider = StateNotifierProvider.autoDispose<TaskProvider, TaskState>(
    (ref) => TaskProvider(ref.read(taskDataUseCaseProvider)));
