// ignore_for_file: unrelated_type_equality_checks, non_constant_identifier_names

import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/modules/projects/detail/controller/project_detail_controller.dart';
import '../../../core/ui/job_timer_icons_icons.dart';
import '../../../view_models/project_view_model.dart';
import 'widgets/project_detail_appbar.dart';
import 'widgets/project_pie_chart.dart';
import 'widgets/project_task_tile.dart';

class ProjectDetailPage extends StatelessWidget {
  final ProjectDetailController controller;

  const ProjectDetailPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProjectDetailController, ProjectDetatilState>(
        bloc: controller,
        listener: (context, state) {
          if (state.status == ProjectDetailStatus.failure) {
            AsukaSnackbar.alert('Erro interno');
          }
        },
        builder: (context, state) {
          final projectViewModel = state.projectViewModel;

          switch (state.status) {
            case ProjectDetailStatus.initial:
              return const Center(
                child: Text('Carregando os projetos'),
              );
            case ProjectDetailStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ProjectDetailStatus.complete:
              return _BuildProjectDetail(context, projectViewModel!);
            case ProjectDetailStatus.failure:
              if (projectViewModel != null) {
                return _BuildProjectDetail(context, projectViewModel);
              }
              return const Center(
                child: Text('Erro ao carregar projeto'),
              );
          }
        },
      ),
    );
  }

  Widget _BuildProjectDetail(
      BuildContext context, ProjectViewModel projectViewModel) {
    final totalTask = projectViewModel.tasks.fold<int>(
      0,
      (totalValue, task) {
        return totalValue += task.duration;
      },
    );
    return CustomScrollView(
      slivers: [
        ProjectDetailAppbar(projectViewModel: projectViewModel),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
                child: ProjectPieChart(
                  projectEstimate: projectViewModel.estimate,
                  totalTasks: totalTask,
                ),
              ),
              ...projectViewModel.tasks
                  .map((tasks) => ProjectTaskTile(taskModel: tasks))
                  .toList(),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Visibility(
                visible: projectViewModel.status != ProjectStatus.finalizado,
                child: ElevatedButton.icon(
                  onPressed: () {
                    controller.finishProject();
                    AsukaSnackbar.success('Finalizado com Sucesso').show();
                  },
                  icon: const Icon(JobTimerIcons.ok_circled2),
                  label: const Text('Finalizar Projeto'),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
