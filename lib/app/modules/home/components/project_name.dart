import 'package:flutter/material.dart';

import '../../../core/ui/job_timer_icons_icons.dart';
import '../../../view_models/project_view_model.dart';

class ProjectName extends StatelessWidget {
  final ProjectViewModel projectViewModel;

  const ProjectName({super.key, required this.projectViewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(projectViewModel.name),
          Icon(
            JobTimerIcons.angle_double_right,
            color: Theme.of(context).primaryColor,
            size: 20,
          )
        ],
      ),
    );
  }
}
