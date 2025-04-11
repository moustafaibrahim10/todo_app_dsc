import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_dsc/cubit/states.dart';
import 'package:todo_dsc/modules/archive_tasks/archive_tasks.dart';
import 'package:todo_dsc/modules/done_tasks/done_tasks.dart';
import 'package:todo_dsc/modules/new_tasks/new_tasks.dart';

class TodoCubit extends Cubit<TodoStates>
{
  TodoCubit():super(InitialState());
  static TodoCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  void changeBottomIndex(index)
  {
    currentIndex=index;
    emit(ChangeBottomIndexState());
  }

  List<Widget> screens=
  [
    NewTasks(), //0
    DoneTasks(),//1
    ArchiveTasks(), //2
  ];

}