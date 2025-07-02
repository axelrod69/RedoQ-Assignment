import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redoq_assignment/features/homeScreen/domain/model/taskModel.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/provider/radioListTileProvider.dart';

class RadioButtonWidget extends ConsumerWidget {
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radioListTile = ref.watch(radioListTileProvider);

    // TODO: implement build
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RadioListTile(
          title: Text('To Do', style: Theme.of(context).textTheme.bodyMedium),
          value: 'To Do',
          groupValue: radioListTile,
          activeColor: Colors.grey,
          onChanged: (value) =>
              ref.read(radioListTileProvider.notifier).state = value,
        ),
        RadioListTile(
          title: Text('In Progress',
              style: Theme.of(context).textTheme.bodyMedium),
          value: 'In Progress',
          groupValue: radioListTile,
          activeColor: Colors.amber,
          onChanged: (value) =>
              ref.read(radioListTileProvider.notifier).state = value,
        ),
        RadioListTile(
          title: Text('Done', style: Theme.of(context).textTheme.bodyMedium),
          value: 'Done',
          groupValue: radioListTile,
          activeColor: Colors.green,
          onChanged: (value) =>
              ref.read(radioListTileProvider.notifier).state = value,
        )
      ],
    );
  }
}
