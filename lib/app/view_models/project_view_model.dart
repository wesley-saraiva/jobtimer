import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'project_task_model.dart';

class ProjectViewModel {
  final int? id;
  final String name;
  final int estimate;
  final ProjectStatus status;
  final List<ProjectTaskModel> tasks;
  ProjectViewModel({
    this.id,
    required this.name,
    required this.estimate,
    required this.status,
    required this.tasks,
  });

  factory ProjectViewModel.fromEntity(Project project) {
    project.tasks.loadSync();
    return ProjectViewModel(
      id: project.id,
      name: project.name,
      estimate: project.estimate,
      status: project.status,
      tasks: project.tasks.map(ProjectTaskModel.fromEntity).toList(),
    );
  }
}
