// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProjectTaskModel {
  int? id;
  String name;
  int duration;
  ProjectTaskModel({
    this.id,
    required this.name,
    required this.duration,
  });

  factory ProjectTaskModel.fromEntity(ProjectTaskModel taskModel) {
    return ProjectTaskModel(
      id: taskModel.id,
      name: taskModel.name,
      duration: taskModel.duration,
    );
  }
}