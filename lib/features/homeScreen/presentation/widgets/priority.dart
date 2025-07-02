import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redoq_assignment/core/utils/dimension.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/provider/priorityProvider.dart';

class PriorityDropDownWidget extends ConsumerWidget {
  final priorityList = ['Low', 'Moderate', 'High'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dimension = Dimension(context: context);
    final selectedPriority = ref.watch(priorityProvider);

    // TODO: implement build
    return DropdownButtonFormField(
      value: selectedPriority,
      decoration: InputDecoration(
        labelText: 'Choose Priority',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      isExpanded: true,
      selectedItemBuilder: (context) {
        return priorityList.map((assignee) {
          return Row(
            children: [
              CircleAvatar(
                  radius: dimension.width * 0.01,
                  backgroundColor: assignee == 'Low'
                      ? Colors.lightBlue
                      : assignee == 'Moderate'
                          ? Colors.orange
                          : Colors.red),
              SizedBox(width: dimension.width * 0.02),
              Text(assignee),
            ],
          );
        }).toList();
      },
      items: priorityList
          .map((assignee) => DropdownMenuItem(
                value: assignee,
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            radius: dimension.width * 0.01,
                            backgroundColor: assignee == 'Low'
                                ? Colors.lightBlue
                                : assignee == 'Moderate'
                                    ? Colors.orange
                                    : Colors.red),
                        SizedBox(width: dimension.width * 0.02),
                        Text(assignee),
                      ],
                    ),
                    SizedBox(height: dimension.height * 0.02),
                  ],
                ),
              ))
          .toList(),
      onChanged: (newValue) {
        ref.read(priorityProvider.notifier).state = newValue.toString();
      },
    );
  }
}
