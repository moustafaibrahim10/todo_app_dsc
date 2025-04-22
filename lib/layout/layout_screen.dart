import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_dsc/cubit/cubit.dart';
import 'package:todo_dsc/cubit/states.dart';
import 'package:todo_dsc/modules/done_tasks/done_tasks.dart';
import 'package:todo_dsc/modules/new_tasks/new_tasks.dart';

class LayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: BlocConsumer<TodoCubit, TodoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TodoCubit.get(context);
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.teal,
                child: Icon(Icons.add,color: Colors.white,),
                onPressed: () async
               {
                 cubit.insertToDatabase(title: 'Go to gym',time: '12:00',date: '4/22/2025');
               }
                ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              selectedFontSize: 16,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'New Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline),
                  label: 'Done Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: 'Archive Tasks',
                ),
              ],
            ),
          );
        },
      ),
    );
  }


  Future<String> getName() async
  {
     return  "Moustafa";
  }
}
