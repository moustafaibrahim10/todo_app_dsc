import 'package:flutter/material.dart';
import 'package:todo_dsc/components/constatns.dart';

import '../../components/components.dart';

class NewTasks extends StatelessWidget {
  const NewTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Tasks')),
      body: buildTaskList(count: 10),
    );
  }
}
