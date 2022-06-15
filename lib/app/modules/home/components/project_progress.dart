import 'package:flutter/material.dart';

import '../../../view_models/project_view_model.dart';

class ProjectProgress extends StatelessWidget {
  final ProjectViewModel projectViewModel;

  const ProjectProgress({super.key, required this.projectViewModel});

  @override
  Widget build(BuildContext context) {
    final totalTasks = projectViewModel.tasks.fold<int>(
        0, ((previousValue, task) => previousValue += task.duration));
    var percent = 0.0;

    if (totalTasks > 0) {
      percent = totalTasks / projectViewModel.estimate;
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Expanded(
            child: LinearProgressIndicator(
              value: percent,
              backgroundColor: Colors.grey[400]!,
              color: percent > 1 ? Colors.red : Theme.of(context).primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text('${projectViewModel.estimate}h'),
          ),
        ],
      ),
    );
  }
}
