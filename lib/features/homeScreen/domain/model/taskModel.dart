import 'package:hive_ce/hive.dart';

part 'taskModel.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final int? taskId;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? position;

  @HiveField(3)
  final String? image;

  @HiveField(4)
  final String? eta;

  @HiveField(5)
  final String? status;

  @HiveField(6)
  final String? priority;

  @HiveField(7)
  final String? title;

  @HiveField(8)
  final String? description;

  TaskModel(
      {this.taskId,
      required this.name,
      required this.position,
      required this.image,
      required this.eta,
      required this.status,
      required this.priority,
      required this.title,
      required this.description});
}
