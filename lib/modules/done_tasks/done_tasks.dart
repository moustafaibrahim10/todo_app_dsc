import 'package:flutter/material.dart';

import '../../components/components.dart';

class DoneTasks extends StatelessWidget {
  const DoneTasks({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Done Tasks'),
      ),
      body: buildTaskList(count: 10),
    );
  }
}
