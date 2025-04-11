import 'package:flutter/material.dart';

import '../../components/components.dart';

class ArchiveTasks extends StatelessWidget {
  const ArchiveTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Archive Tasks'),
      ),
      body:buildTaskList(count: 10),
    );
  }
}
