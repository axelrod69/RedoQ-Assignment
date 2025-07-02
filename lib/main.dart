import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:redoq_assignment/app/routes.dart';
import 'package:redoq_assignment/core/theme/appTheme.dart';
import 'package:redoq_assignment/features/homeScreen/domain/model/taskModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('taskBox');
  await Hive.openBox<TaskModel>('inProgressBox');
  await Hive.openBox<TaskModel>('completedBox');
  await Hive.openBox<TaskModel>('allTaskBox');

  runApp(ProviderScope(
    child: ToDo(),
  ));
}

class ToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      routerConfig: AppRouter.router,
    );
  }
}
