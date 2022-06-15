// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/home/controller/home_controller.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';
import '../../../modules/home/components/project_name.dart';
import '../components/project_progress.dart';

class ProjectTile extends StatelessWidget {
  final ProjectViewModel projectViewModel;

  const ProjectTile({super.key, required this.projectViewModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Modular.to
            .pushNamed('/project/detail', arguments: projectViewModel);
        Modular.get<HomeController>().updateList();
      },
      child: Container(
        constraints: const BoxConstraints(maxHeight: 90),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey[300]!,
            width: 4,
          ),
        ),
        child: Column(
          children: [
            ProjectName(projectViewModel: projectViewModel),
            Expanded(
              child: ProjectProgress(projectViewModel: projectViewModel),
            ),
          ],
        ),
      ),
    );
  }
}
