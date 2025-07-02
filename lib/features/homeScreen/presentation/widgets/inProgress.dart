import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redoq_assignment/core/utils/dimension.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/provider/taskProvider.dart';
import 'package:redoq_assignment/core/widgets/card.dart';

class InProgress extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dimension = Dimension(context: context);
    final inProgressList = ref.watch(taskProvider);

    // TODO: implement build
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: dimension.height * 0.02,
            horizontal: dimension.width * 0.04),
        child: inProgressList.inProgressList!.isEmpty
            ? Center(
                child: Text('No Tasks'),
              )
            : ListView.builder(
                itemCount: inProgressList.inProgressList?.length,
                itemBuilder: (context, index) =>
                    CardWidget(taskModel: inProgressList.inProgressList?[index]),
              ));
  }
}
