// ignore_for_file: override_on_non_overriding_member

import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/repositories/projects/project_repository.dart';
import 'package:job_timer/app/view_models/project_task_model.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

import '../../entities/project_task.dart';
import './project_service.dart';

class ProjectServiceImpl implements ProjectService {
  final ProjectRepository _projectRepository;

  ProjectServiceImpl({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;

  @override
  Future<void> register(ProjectViewModel projectViewModel) async {
    final project = Project()
      ..id = projectViewModel.id
      ..name = projectViewModel.name
      ..status = projectViewModel.status
      ..estimate = projectViewModel.estimate;

    await _projectRepository.register(project);
  }

  @override
  Future<List<ProjectViewModel>> findByStatus(ProjectStatus status) async {
    final projects = await _projectRepository.findByStatus(status);
    return projects.map(ProjectViewModel.fromEntity).toList();
  }

  @override
  Future<ProjectViewModel> addTask(
      int projectId, ProjectTaskModel taskModel) async {
    final projectTask = ProjectTask()
      ..name = taskModel.name
      ..duration = taskModel.duration;
    final project = await _projectRepository.addTask(projectId, projectTask);
    return ProjectViewModel.fromEntity(project);
  }

  @override
  Future<ProjectViewModel> findById(int projectId) async {
    final project = await _projectRepository.findById(projectId);
    return ProjectViewModel.fromEntity(project);
  }

  @override
  Future<void> finish(int projectId) => _projectRepository.finish(projectId);
}
