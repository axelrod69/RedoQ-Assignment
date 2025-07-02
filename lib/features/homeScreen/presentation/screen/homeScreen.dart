import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:redoq_assignment/core/utils/dimension.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/widgets/bottomSheet.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/provider/assigneeProvider.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/widgets/done.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/widgets/inProgress.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/widgets/toDo.dart';

class HomeScreen extends ConsumerWidget {
  final List<String> tabs = ['To Do', 'In Progress', 'Done'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () =>
                showCustomModal(context: context, ref: ref, isEdit: false),
            child: Icon(Icons.add)),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title:
              Text('To Do', style: Theme.of(context).textTheme.headlineLarge),
          actions: [
            IconButton(onPressed: () => context.goNamed('search'), icon: Icon(Icons.search))],
          bottom: TabBar(
            labelStyle: Theme.of(context).textTheme.bodySmall,
            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          ),
        ),
        body: SafeArea(
          child: TabBarView(children: [ToDo(), InProgress(), Done()]),
        ),
      ),
    );
  }
}
