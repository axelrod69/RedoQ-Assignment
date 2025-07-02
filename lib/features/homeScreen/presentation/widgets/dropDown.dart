import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redoq_assignment/core/utils/dimension.dart';
import 'package:redoq_assignment/features/homeScreen/domain/model/assigneeModel.dart';
import 'package:redoq_assignment/features/homeScreen/domain/model/taskModel.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/provider/assigneeProvider.dart';

class DropDownWidget extends ConsumerStatefulWidget {
  final TaskModel? taskModel;

  DropDownWidget({this.taskModel});

  @override
  ConsumerState<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends ConsumerState<DropDownWidget> {
  @override
  void initState() {
    super.initState();

    // Set selectedAssignee if editing
    if (widget.taskModel != null) {
      final assignees = ref.read(assigneeProvider).assigneeModel ?? [];

      try {
        final matchingAssignee = assignees.firstWhere(
          (assignee) =>
              assignee.name == widget.taskModel?.name &&
              assignee.department == widget.taskModel?.position,
        );

        ref.read(selectedAssigneeProvider.notifier).state = matchingAssignee;
      } catch (e) {
        // If no match found, do nothing
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final dimension = Dimension(context: context);
    final selectedAssignee = ref.watch(selectedAssigneeProvider);
    final assigneeList = ref.watch(assigneeProvider);

    return DropdownButtonFormField<AssigneeModel>(
      value: selectedAssignee,
      decoration: InputDecoration(
        labelText: 'Select Assignee',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      isExpanded: true,
      selectedItemBuilder: (context) {
        return assigneeList.assigneeModel!.map((assignee) {
          return Row(
            children: [
              ClipOval(
                child: Image.asset(
                  assignee.image ?? '',
                  width: dimension.width * 0.06,
                  height: dimension.width * 0.06,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: dimension.width * 0.02),
              Text(assignee.name ?? ''),
            ],
          );
        }).toList();
      },
      items: assigneeList.assigneeModel!
          .map((assignee) => DropdownMenuItem(
                value: assignee,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: dimension.width * 0.06,
                      backgroundColor: const Color.fromARGB(153, 149, 143, 143),
                      child: ClipOval(
                        child: Image.asset(
                          assignee.image ?? '',
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    SizedBox(width: dimension.width * 0.02),
                    Text(assignee.name ?? ''),
                  ],
                ),
              ))
          .toList(),
      onChanged: (AssigneeModel? newValue) {
        ref.read(selectedAssigneeProvider.notifier).state = newValue;
      },
    );
  }
}

// class DropDownWidget extends ConsumerWidget {
//   final TaskModel? taskModel;

//   DropDownWidget({this.taskModel});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final dimension = Dimension(context: context);
//     final selectedAssignee = ref.watch(selectedAssigneeProvider);
//     final assigneeList = ref.watch(assigneeProvider);

//     // TODO: implement build
//     return taskModel != null
//         ? Row(
//             children: [
//               ClipOval(
//                 child: Image.asset(
//                   taskModel?.image ?? '',
//                   width: dimension.width * 0.06,
//                   height: dimension.width * 0.06,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               SizedBox(width: dimension.width * 0.02),
//               Text(taskModel?.name ?? ''),
//             ],
//           )
//         : DropdownButtonFormField<AssigneeModel>(
//             value: selectedAssignee,
//             decoration: InputDecoration(
//               labelText: 'Select Assignee',
//               floatingLabelBehavior: FloatingLabelBehavior.auto,
//               border: OutlineInputBorder(),
//               contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             ),
//             isExpanded: true,
//             selectedItemBuilder: (context) {
//               return assigneeList.assigneeModel!.map((assignee) {
//                 return Row(
//                   children: [
//                     ClipOval(
//                       child: Image.asset(
//                         assignee.image ?? '',
//                         width: dimension.width * 0.06,
//                         height: dimension.width * 0.06,
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                     SizedBox(width: dimension.width * 0.02),
//                     Text(assignee.name ?? ''),
//                   ],
//                 );
//               }).toList();
//             },
//             items: assigneeList.assigneeModel!
//                 .map((assignee) => DropdownMenuItem(
//                       value: assignee,
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               CircleAvatar(
//                                 radius: dimension.width * 0.06,
//                                 backgroundColor:
//                                     const Color.fromARGB(153, 149, 143, 143),
//                                 child: ClipOval(
//                                   child: Image.asset(
//                                     taskModel?.image ?? assignee.image ?? '',
//                                     fit: BoxFit.contain,
//                                     width: double.infinity,
//                                     height: double.infinity,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(width: dimension.width * 0.02),
//                               Text(assignee.name ?? ''),
//                             ],
//                           ),
//                           SizedBox(height: dimension.height * 0.02),
//                         ],
//                       ),
//                     ))
//                 .toList(),
//             onChanged: (AssigneeModel? newValue) {
//               ref.read(selectedAssigneeProvider.notifier).state = newValue;
//             },
//           );
//   }
// }
