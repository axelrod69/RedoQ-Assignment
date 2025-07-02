import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redoq_assignment/core/utils/dimension.dart';
import 'package:redoq_assignment/features/homeScreen/domain/model/taskModel.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/provider/assigneeProvider.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/provider/dateProvider.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/provider/priorityProvider.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/provider/radioListTileProvider.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/provider/taskProvider.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/widgets/datePicker.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/widgets/dropDown.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/widgets/priority.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/widgets/radioButton.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/widgets/submitButton.dart';

void showCustomModal(
    {required BuildContext context,
    required WidgetRef ref,
    required bool isEdit,     // Determines if bottom sheet is to be used for adding new task or updating it
    TaskModel? taskModel}) {
  final dimension = Dimension(context: context);

  final TextEditingController titleController =
      TextEditingController(text: taskModel?.title ?? '');
  final TextEditingController taskController =
      TextEditingController(text: taskModel?.description ?? '');

  if (isEdit && taskModel != null) {
    ref.read(radioListTileProvider.notifier).state =
        taskModel.status ?? 'To Do';
    ref.read(priorityProvider.notifier).state = taskModel.priority ?? 'Low';
    ref.read(dateProvider.notifier).state = taskModel.eta ?? '';
  }

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(dimension.width * 0.08)),
      ),
      builder: (context) => Padding(
            padding: EdgeInsets.only(
                left: dimension.width * 0.05,
                top: dimension.height * 0.02,
                right: dimension.width * 0.05),
            child: SizedBox(
                height: dimension.height * 0.8,
                child: ListView(
                  children: [
                    Text(isEdit == true ? 'Edit Task' : 'Add New Task',
                        style: Theme.of(context).textTheme.bodyMedium),
                    SizedBox(height: dimension.height * 0.02),
                    TextField(
                      controller: titleController,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: dimension.height * 0.02),
                    TextField(
                      controller: taskController,
                      style: Theme.of(context).textTheme.bodyMedium,
                      minLines: 1,
                      maxLines: 8,
                      decoration: InputDecoration(
                          labelText: 'Description',
                          border: OutlineInputBorder(),
                          isDense: false),
                    ),
                    SizedBox(height: dimension.height * 0.02),
                    Row(
                      children: [
                        Text(isEdit == true ? 'Assigned To:' : 'Assign To:',
                            style: Theme.of(context).textTheme.bodyMedium),
                        SizedBox(width: dimension.width * 0.02),
                        Expanded(
                          child: isEdit == true
                              ? DropDownWidget(taskModel: taskModel)
                              : DropDownWidget(),
                        )
                      ],
                    ),
                    SizedBox(height: dimension.height * 0.02),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Status: ',
                            style: Theme.of(context).textTheme.bodyMedium),
                        Expanded(child: RadioButtonWidget())
                      ],
                    ),
                    SizedBox(height: dimension.height * 0.02),
                    PriorityDropDownWidget(),
                    SizedBox(height: dimension.height * 0.04),
                    DatePickerWidget(),
                    SizedBox(height: dimension.height * 0.02),
                    isEdit == true
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                                SubmitButton(
                                  isEdit: isEdit,
                                  title: titleController.text,
                                  description: taskController.text,
                                  existingTask: taskModel,
                                ),
                                IconButton(
                                    onPressed: () {
                                      ref
                                          .read(taskProvider.notifier)
                                          .deleteTask(
                                              taskId: taskModel?.taskId ?? 0,
                                              boxName:
                                                  taskModel?.status ?? 'To Do');
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.delete, color: Colors.red))
                              ])
                        : SubmitButton(
                            isEdit: isEdit,
                            title: titleController.text,
                            description: taskController.text,
                          )
                  ],
                )),
          )).whenComplete(() {
    if (isEdit == true) {

      // Resets inputs if bottom sheet is popped in the event save is not clicked

      ref.read(selectedAssigneeProvider.notifier).state = null;
      ref.read(priorityProvider.notifier).state = null;
      ref.read(dateProvider.notifier).state = null;
      ref.read(radioListTileProvider.notifier).state = 'To Do';
    }
  });
}
