import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/entities/project_task.dart';
import 'package:job_timer/app/view_models.dart/project_task_model.dart';

class ProjectModel {
  final int? id;
  final String name;
  final ProjectStatus status;
  final List<ProjectTaskModel> tasks;
  final int estimate;
  ProjectModel({
    this.id,
    required this.name,
    required this.status,
    required this.tasks,
     required this.estimate,
  });
}
