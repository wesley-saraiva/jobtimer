// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'project_detail_controller.dart';

enum ProjectDetailStatus {
  initial,
  loading,
  complete,
  failure,
}

class ProjectDetatilState extends Equatable {
  final ProjectDetailStatus status;
  final ProjectViewModel? projectViewModel;

  const ProjectDetatilState._({
    required this.status,
    this.projectViewModel,
  });

  const ProjectDetatilState.initial()
      : this._(status: ProjectDetailStatus.initial);

  ProjectDetatilState copyWith({
    ProjectDetailStatus? status,
    ProjectViewModel? projectViewModel,
  }) {
    return ProjectDetatilState._(
      status: status ?? this.status,
      projectViewModel: projectViewModel ?? this.projectViewModel,
    );
  }

  @override
  List<Object?> get props => [status, projectViewModel];
}
