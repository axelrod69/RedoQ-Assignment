import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redoq_assignment/core/utils/appLog.dart';
import 'package:redoq_assignment/features/homeScreen/domain/model/taskModel.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/provider/assigneeProvider.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/provider/dateProvider.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/provider/priorityProvider.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/provider/radioListTileProvider.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/provider/taskProvider.dart';

class SubmitButton extends ConsumerWidget {
  final bool? isEdit;
  final String? title;
  final String? description;
  final TaskModel? existingTask;

  SubmitButton(
      {required this.isEdit,
      required this.title,
      required this.description,
      this.existingTask});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return ElevatedButton(
        onPressed: () {
          {
            final selectedAssignee = ref.read(selectedAssigneeProvider);
            final selectedDate = ref.read(dateProvider);
            final radioListTile = ref.read(radioListTileProvider);
            final selectedPriority = ref.read(priorityProvider);

            final taskModel = isEdit == true
                ? TaskModel(
                    taskId: existingTask?.taskId,
                    name: selectedAssignee?.name,
                    position: selectedAssignee?.department,
                    image: selectedAssignee?.image,
                    eta: selectedDate,
                    status: radioListTile,
                    priority: selectedPriority,
                    title: title,
                    description: description,
                  )
                : TaskModel(
                    taskId: Random().nextInt(1000),
                    name: selectedAssignee?.name,
                    position: selectedAssignee?.department,
                    image: selectedAssignee?.image,
                    eta: selectedDate,
                    status: radioListTile,
                    priority: selectedPriority,
                    title: title,
                    description: description,
                  );

            isEdit == true
                ? ref.read(taskProvider.notifier).updateTask(
                    updatedTask: taskModel, boxName: taskModel.status ?? '')
                : radioListTile == 'To Do'
                    ? ref
                        .read(taskProvider.notifier)
                        .addToTaskList(task: taskModel)
                    : radioListTile == 'In Progress'
                        ? ref
                            .read(taskProvider.notifier)
                            .addToInProgressList(task: taskModel)
                        : ref
                            .read(taskProvider.notifier)
                            .addToDoneList(task: taskModel);

            ref.read(selectedAssigneeProvider.notifier).state = null;
            ref.read(dateProvider.notifier).state = null;
            ref.read(priorityProvider.notifier).state = null;
            ref.read(radioListTileProvider.notifier).state = 'To Do';

            Navigator.pop(context);
          }
        },
        style:
            ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent[100]),
        child: Text(isEdit == true ? 'Save' : 'Add',
            style: TextStyle(color: Colors.white)));
  }
}
