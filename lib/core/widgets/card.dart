import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redoq_assignment/core/utils/dimension.dart';
import 'package:redoq_assignment/features/homeScreen/domain/model/taskModel.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/widgets/bottomSheet.dart';

class CardWidget extends ConsumerWidget {
  final TaskModel? taskModel;

  CardWidget({required this.taskModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dimension = Dimension(context: context);

    // TODO: implement build
    return Container(
      width: double.infinity,
      height: dimension.height * 0.45,
      padding: EdgeInsets.all(dimension.width * 0.02),
      margin: EdgeInsets.only(bottom: dimension.height * 0.02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(dimension.width * 0.05),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset:
                    Offset(dimension.height * 0.004, dimension.width * 0.008),
                blurRadius: dimension.width * 0.02)
          ]),
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: Row(
              children: [
                CircleAvatar(
                  radius: dimension.width * 0.15,
                  backgroundColor: const Color.fromARGB(153, 149, 143, 143),
                  child: ClipOval(
                    child: Image.asset(
                      // 'assets/images/bruno.png',
                      taskModel?.image ?? '',
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          // 'Bruno Fernandes',
                          taskModel?.name ?? '',
                          style: Theme.of(context).textTheme.bodyMedium),
                      SizedBox(height: dimension.height * 0.01),
                      Expanded(
                          child: Text(
                        // 'Attacking/Central/Deep Lying Midfielder',
                        taskModel?.position ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey),
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: dimension.height * 0.02),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Row(
                          children: [
                            Icon(Icons.calendar_month),
                            SizedBox(width: dimension.width * 0.02),
                            Text('ETA: ${taskModel?.eta ?? ''}',
                                style: Theme.of(context).textTheme.bodySmall)
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Row(
                          children: [
                            Icon(
                                taskModel?.priority == 'High'
                                    ? Icons.arrow_upward_outlined
                                    : taskModel?.priority == 'Low'
                                        ? Icons.arrow_downward_outlined
                                        : Icons.pool,
                                color: taskModel?.priority == 'High'
                                    ? Colors.red
                                    : taskModel?.priority == 'Low'
                                        ? Colors.lightBlue
                                        : Colors.orange),
                            SizedBox(width: dimension.width * 0.02),
                            Text(taskModel?.priority ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: taskModel?.priority == 'High'
                                            ? Colors.red
                                            : taskModel?.priority == 'Low'
                                                ? Colors.lightBlue
                                                : Colors.orange,
                                        fontWeight: FontWeight.bold))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: dimension.width * 0.02,
                              backgroundColor: taskModel?.status == 'To Do'
                                  ? Colors.grey
                                  : taskModel?.status == 'In Progress'
                                      ? Colors.amber
                                      : Colors.green,
                            ),
                            SizedBox(width: dimension.width * 0.02),
                            Text(
                                taskModel?.status == 'To Do'
                                    ? 'To Do'
                                    : taskModel?.status == 'In Progress'
                                        ? 'In Progress'
                                        : 'Done',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: taskModel?.status == 'To Do'
                                            ? Colors.grey
                                            : taskModel?.status == 'In Progress'
                                                ? Colors.amber
                                                : Colors.green,
                                        fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: SizedBox(width: double.infinity),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: dimension.height * 0.01),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Title', style: Theme.of(context).textTheme.bodySmall),
                Text(taskModel?.title ?? ''),
                Divider(),
                Text('Description',
                    style: Theme.of(context).textTheme.bodySmall),
                Expanded(
                    child: ListView(
                  children: [
                    Text(taskModel?.description ?? '',
                        style: Theme.of(context).textTheme.bodyMedium)
                  ],
                )),
                SizedBox(height: dimension.height * 0.02),
                Center(
                    child: GestureDetector(
                  onTap: () =>
                      showCustomModal(context: context, ref: ref, isEdit: true, taskModel: taskModel),
                  child: Text('View',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
