import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/projects/detail/controller/project_detail_controller.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

class NewTasks extends StatelessWidget {
  final ProjectViewModel projectViewModel;

  const NewTasks({
    super.key,
    required this.projectViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Modular.to
            .pushNamed('/project/task', arguments: projectViewModel);
        Modular.get<ProjectDetailController>().updateProject();
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const Text('Adicionar Task'),
        ],
      ),
    );
  }
}
