import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/view_models/project_task_model.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

abstract class ProjectService {
  Future<void> register(ProjectViewModel projectViewModel);
  Future<List<ProjectViewModel>> findByStatus(ProjectStatus status);
  Future<ProjectViewModel> findById(int projectId);
  Future<ProjectViewModel> addTask(int projetId, ProjectTaskModel taskModel);
  Future<void> finish(int projectId);
}
